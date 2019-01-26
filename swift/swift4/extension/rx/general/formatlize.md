## Formatlize

Swift の `materialize()` で取得できる型 `Result<E>` には Optional で各パラメータが渡される。
これらのエラーハンドリングを行う際，アンラップ処理だけで ViewModel が肥大化してしまう。
それぞれを Observable にて必要がある場合のみ取得して欲しい，そんなフォーマット化，`formatlize()` を作成した。

#### 軽量版

```swift
import RxSwift

extension Observable {
    /// The result and the process of Observable
    func formatlize() -> (succeeded: Observable<E>, failed: Observable<Error>, processing: Observable<Bool>) {
        let observableEvent: Observable<Event<E>> = materialize().share(replay: 1)
        let succeeded: Observable<E> = observableEvent.map { $0.element }.unwrap().share(replay: 1)
        let failed: Observable<Error> = observableEvent.map { $0.error }.unwrap().share(replay: 1)
        let processing: Observable<Bool> = Observable<Bool>.merge(Observable<Bool>.just(true),
                                                                  succeeded.mapToFalse(),
                                                                  failed.mapToFalse()).distinctUntilChanged()
        return (succeeded, failed, processing)
    }
}

extension PrimitiveSequence {
    /// The result and the process of PrimitiveSequence
    func formatlize() -> (succeeded: Single<E>, failed: Single<Error>, processing: Observable<Bool>) {
        let observableEvent: Observable<Event<E>> = asObservable().materialize().share(replay: 1)
        let succeeded: Observable<E> = observableEvent.map { $0.element }.unwrap().share(replay: 1)
        let failed: Observable<Error> = observableEvent.map { $0.error }.unwrap().share(replay: 1)
        let processing: Observable<Bool> = Observable.merge(Observable.just(true),
                                                            succeeded.mapToFalse(),
                                                            failed.mapToFalse()).distinctUntilChanged()
        return (succeeded.take(1).asSingle(), failed.take(1).asSingle(), processing)
    }
}
```

#### しっかりしたやつ

```swift
import RxSwift

/// 処理の結果を示すことが可能な Format の要素
protocol FormatResultConvertibleType {
    associatedtype W
    associatedtype F

    /// 処理が成功した場合
    var succeeded: W { get }
    /// 処理が失敗した場合
    var failed: F { get }
}

/// 処理の過程を示すことが可能な Format の要素
protocol FormatProcessingConvertibleType {
    associatedtype P

    /// 処理中であるかの状態
    var processing: P { get }
}

/// 処理の結果と過程を示すことが可能なクラス
class Format<Wrapped, Element, Failure, Processing>: FormatResultConvertibleType, FormatProcessingConvertibleType {
    typealias W = Wrapped
    typealias E = Element
    typealias F = Failure
    typealias P = Processing

    /// 処理が成功した場合
    var succeeded: Wrapped
    /// 処理が失敗した場合
    var failed: Failure
    /// 処理中であるかの状態
    var processing: Processing

    init(succeeded: Wrapped, failed: Failure, processing: Processing) {
        self.succeeded = succeeded
        self.failed = failed
        self.processing = processing
    }
}

/// 処理の過程である `processing` を Observable で取得可能にした Format
typealias ObservableProcessingFormat<Wrapped, Element, Failure> = Format<Wrapped, Element, Failure, Observable<Bool>>
/// 処理の結果を Observable で取得可能な Format
/// - Note: Event との差異は Optional でない点，処理中の状態を購読可能な点。
typealias ObservableFormat<Element> = ObservableProcessingFormat<Observable<Element>, Element, Observable<Error>>
/// 処理の結果を Single で取得可能な Format
typealias SingleFormat<Element> = ObservableProcessingFormat<Single<Element>, Element, Single<Error>>

extension Observable {
    /// The result and the process of Observable
    func formatlize() -> ObservableFormat<E> {
        let observableEvent: Observable<Event<E>> = materialize().share(replay: 1)
        let succeeded: Observable<E> = observableEvent.map { $0.element }.unwrap().share(replay: 1)
        let failed: Observable<Error> = observableEvent.map { $0.error }.unwrap().share(replay: 1)
        let processing: Observable<Bool> = Observable<Bool>.merge(Observable<Bool>.just(true),
                                                                  succeeded.mapToFalse(),
                                                                  failed.mapToFalse()).distinctUntilChanged()
        return ObservableFormat(succeeded: succeeded,
                                failed: failed,
                                processing: processing)
    }
}

extension PrimitiveSequence {
    /// The result and the process of PrimitiveSequence
    func formatlize() -> SingleFormat<E> {
        let observableEvent: Observable<Event<E>> = asObservable().materialize().share(replay: 1)
        let succeeded: Observable<E> = observableEvent.map { $0.element }.unwrap().share(replay: 1)
        let failed: Observable<Error> = observableEvent.map { $0.error }.unwrap().share(replay: 1)
        let processing: Observable<Bool> = Observable.merge(Observable.just(true),
                                                            succeeded.mapToFalse(),
                                                            failed.mapToFalse()).distinctUntilChanged()
        return SingleFormat(succeeded: succeeded.take(1).asSingle(),
                            failed: failed.take(1).asSingle(),
                            processing: processing)
    }
}
```

#### Driver対応版

```swift
import RxCocoa
import RxSwift

/// 処理の結果を示すことが可能な Format の要素
protocol FormatResultConvertibleType {
    associatedtype W
    associatedtype F

    /// 処理が成功した場合
    var succeeded: W { get }
    /// 処理が失敗した場合
    var failed: F { get }
}

/// 処理の過程を示すことが可能な Format の要素
protocol FormatProcessingConvertibleType {
    associatedtype P

    /// 処理中であるかの状態
    var processing: P { get }
}

/// 処理の結果と過程を示すことが可能なクラス
class Format<Wrapped, Element, Failure, Processing>: FormatResultConvertibleType, FormatProcessingConvertibleType {
    typealias W = Wrapped
    typealias E = Element
    typealias F = Failure
    typealias P = Processing

    /// 処理が成功した場合
    var succeeded: Wrapped
    /// 処理が失敗した場合
    var failed: Failure
    /// 処理中であるかの状態
    var processing: Processing

    init(succeeded: Wrapped, failed: Failure, processing: Processing) {
        self.succeeded = succeeded
        self.failed = failed
        self.processing = processing
    }
}

/// 処理の過程である `processing` を Observable で取得可能にした Format
typealias ObservableProcessingFormat<Wrapped, Element, Failure> = Format<Wrapped, Element, Failure, Observable<Bool>>
/// 処理の結果を Observable で取得可能な Format
/// - Note: Event との差異は Optional でない点，処理中の状態を購読可能な点。
typealias FormattedObservable<Element> = ObservableProcessingFormat<Observable<Element>, Element, Observable<Error>>
/// 処理の結果を Single で取得可能な Format
typealias FormattedSingle<Element> = ObservableProcessingFormat<Single<Element>, Element, Single<Error>>
/// 処理の結果を Driver で取得可能な Format
typealias FormattedDriver<Element> = Format<Driver<Element>, Element, Driver<Error>, Driver<Bool>>

extension Observable {
    /// The result and the process of Observable
    func formatlize() -> FormattedObservable<E> {
        let observableEvent: Observable<Event<E>> = materialize().share(replay: 1)
        let succeeded: Observable<E> = observableEvent.map { $0.element }.unwrap().share(replay: 1)
        let failed: Observable<Error> = observableEvent.map { $0.error }.unwrap().share(replay: 1)
        let processing: Observable<Bool> = Observable<Bool>.merge(Observable<Bool>.just(true),
                                                                  succeeded.mapToFalse(),
                                                                  failed.mapToFalse()).distinctUntilChanged()
        return FormattedObservable(succeeded: succeeded,
                                   failed: failed,
                                   processing: processing)
    }
}

extension Single {
    /// The result and the process of PrimitiveSequence
    func formatlize() -> FormattedSingle<E> {
        let observableEvent: Observable<Event<E>> = asObservable().materialize().share(replay: 1)
        let succeeded: Observable<E> = observableEvent.map { $0.element }.unwrap().share(replay: 1)
        let failed: Observable<Error> = observableEvent.map { $0.error }.unwrap().share(replay: 1)
        let processing: Observable<Bool> = Observable.merge(Observable.just(true),
                                                            succeeded.mapToFalse(),
                                                            failed.mapToFalse()).distinctUntilChanged()
        return FormattedSingle(succeeded: succeeded.take(1).asSingle(),
                               failed: failed.take(1).asSingle(),
                               processing: processing)
    }
}

extension Format where Wrapped: Observable<Element>, Failure: Observable<Error>, Processing: Observable<Bool> {
    func asDriver(onErrorJustReturn replaced: (succeeded: Element, failed: Error, processing: Bool)) -> FormattedDriver<E> {
        return FormattedDriver(succeeded: succeeded.asDriver(onErrorJustReturn: replaced.succeeded),
                               failed: failed.asDriver(onErrorJustReturn: replaced.failed),
                               processing: processing.asDriver(onErrorJustReturn: replaced.processing))
    }

    func asDriverOnErrorJustComplete() -> FormattedDriver<E> {
        return FormattedDriver(succeeded: succeeded.asDriverOnErrorJustComplete(),
                               failed: failed.asDriverOnErrorJustComplete(),
                               processing: processing.asDriverOnErrorJustComplete())
    }
}

extension Format where Wrapped == Single<Element>, Failure == Single<Error>, Processing: Observable<Bool> {
    func asObservable() -> FormattedObservable<E> {
        return FormattedObservable(succeeded: succeeded.asObservable(),
                                   failed: failed.asObservable(),
                                   processing: processing)
    }

    func asDriver(onErrorJustReturn replaced: (succeeded: Element, failed: Error, processing: Bool)) -> FormattedDriver<E> {
        return FormattedDriver(succeeded: succeeded.asDriver(onErrorJustReturn: replaced.succeeded),
                               failed: failed.asDriver(onErrorJustReturn: replaced.failed),
                               processing: processing.asDriver(onErrorJustReturn: replaced.processing))
    }

    func asDriverOnErrorJustComplete() -> FormattedDriver<E> {
        return FormattedDriver(succeeded: succeeded.asObservable().asDriverOnErrorJustComplete(),
                               failed: failed.asObservable().asDriverOnErrorJustComplete(),
                               processing: processing.asDriverOnErrorJustComplete())
    }
}
```

#### Extension

```swift
import RxCocoa
import RxSwift

extension ObservableType {
    func mapToTrue() -> Observable<Bool> {
        return map { _ in true }
    }

    func mapToFalse() -> Observable<Bool> {
        return map { _ in false }
    }

    func unwrap<T>() -> Observable<T> where E == T? {
        return filter { $0 != nil }.map { $0! }
    }

    func asDriverOnErrorJustComplete() -> Driver<E> {
        return asDriver { _ in
            return Driver.empty()
        }
    }
}
```
