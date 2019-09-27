## BackgroundWorker

```swift
//
//  BackgroundWorker.swift
//
//  Created by Yuto Mizutani on 2019/09/10.
//

import RxSwift

public final class BackgroundWorker<Element>: ObservableType {
    /// Cached previous value and always observing cached or will-fetch value when subscribed
    private let subject = ReplaySubject<Element>.create(bufferSize: 1)
    private let disposeBag = DisposeBag()

    public init(_ source: Observable<Element>) {
        source
            .observeOn(ConcurrentDispatchQueueScheduler(queue: .global()))
            .bind(to: subject)
            .disposed(by: disposeBag)
    }

    /// Subscribes observer
    public func subscribe<Observer: ObserverType>(_ observer: Observer) -> Disposable where Observer.Element == Element {
        return subject.subscribe(observer)
    }

    /// - returns: Canonical interface for push style sequence
    public func asObservable() -> Observable<Element> {
        return subject.asObservable()
    }
}

public extension ObservableType {
    func toBackground() -> BackgroundWorker<Element> {
        return BackgroundWorker(asObservable())
    }
}
```
