## distinctUntilChanged

```swift
let relay = PublishRelay<Bool>()

_ = relay.asObservable()
	.distinctUntilChanged()
	.subscribe(onNext: { print($0) })

relay.accept(true) // true
relay.accept(true)
relay.accept(true)
relay.accept(false) // false
```

```swift
let relay = PublishRelay<Int>()

_ = relay.asObservable()
	.distinctUntilChanged()
	.subscribe(onNext: { print($0) })

relay.accept(0) // 0
relay.accept(1) // 1
relay.accept(1)
relay.accept(0) // 0
```

[RxSwift/Observables/DistinctUntilChanged.swift](https://github.com/ReactiveX/RxSwift/blob/master/RxSwift/Observables/DistinctUntilChanged.swift)