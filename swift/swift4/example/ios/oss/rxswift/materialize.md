## Materialize

エラーを `RxSwift.Event` 型にラップし，flatMap が異常終了しないようにする。

```swift
import RxSwift

Single.just(())
  .flatMap { _ in Single.just(.error(RxSwift.noElements)).materialize() }
  .subscribe(onNext: { print($0) }) // RxSwift.Event
```

[RxSwift/Event.swift at master · ReactiveX/RxSwift · GitHub](https://github.com/ReactiveX/RxSwift/blob/master/RxSwift/Event.swift)
[RxSwift/Materialize.swift at master · ReactiveX/RxSwift · GitHub](https://github.com/ReactiveX/RxSwift/blob/master/RxSwift/Observables/Materialize.swift)
[Materialize/Dematerialize](http://reactivex.io/documentation/operators/materialize-dematerialize.html)
