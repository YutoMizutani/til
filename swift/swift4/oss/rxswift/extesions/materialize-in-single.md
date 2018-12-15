## Materialize in Single

```swift
public extension PrimitiveSequence {
    func materialize() -> Single<Event<Element>> {
        // Single traits take the success/error parameter and `Complete` signal,
        // so it should to use `take(1)` operator.
        return asObservable().materialize().take(1).asSingle()
    }
}
```

[RxSwift/Event.swift at master · ReactiveX/RxSwift · GitHub](https://github.com/ReactiveX/RxSwift/blob/master/RxSwift/Event.swift)
