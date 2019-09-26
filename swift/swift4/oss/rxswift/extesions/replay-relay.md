## ReplayRelay

```swift
//
//  ReplayRelay.swift
//
//  Created by Yuto Mizutani on 2019/09/05.
//  Copyright © 2019 Yuto Mizutani. All rights reserved.
//

import RxSwift

/// ReplayRelay is a wrapper for `ReplaySubject`.
///
/// Unlike `ReplaySubject` it can't terminate with error or completed.
public final class ReplayRelay<Element>: ObservableType {
    private let _subject: ReplaySubject<Element>

    /// Accepts `event` and emits it to subscribers
    public func accept(_ event: Element) {
        self._subject.onNext(event)
    }

    /// Initializes behavior relay with buffer size.
    public init(_ bufferSize: Int = 1) {
        self._subject = ReplaySubject.create(bufferSize: bufferSize)
    }

    /// Subscribes observer
    public func subscribe<Observer: ObserverType>(_ observer: Observer) -> Disposable where Observer.Element == Element {
        return self._subject.subscribe(observer)
    }

    /// - returns: Canonical interface for push style sequence
    public func asObservable() -> Observable<Element> {
        return self._subject.asObservable()
    }
}
```

```swift
//
//  ReplayRelay+Bind.swift
//
//  Created by Yuto Mizutani on 2019/09/25.
//

import RxSwift

// cf. https://raw.githubusercontent.com/ReactiveX/RxSwift/c6c0c540109678b96639c25e9c0ebe4a6d7a69a9/RxRelay/Observable%2BBind.swift
public extension ObservableType {
    /**
     Creates new subscription and sends elements to publish relay(s).
     In case error occurs in debug mode, `fatalError` will be raised.
     In case error occurs in release mode, `error` will be logged.
     - parameter to: Target publish relays for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer.
     */
    func bind(to relays: ReplayRelay<Element>...) -> Disposable {
        return bind(to: relays)
    }

    /**
     Creates new subscription and sends elements to publish relay(s).

     In case error occurs in debug mode, `fatalError` will be raised.
     In case error occurs in release mode, `error` will be logged.

     - parameter to: Target publish relays for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer.
     */
    func bind(to relays: ReplayRelay<Element?>...) -> Disposable {
        return map { $0 as Element? }.bind(to: relays)
    }

    /**
     Creates new subscription and sends elements to publish relay(s).
     In case error occurs in debug mode, `fatalError` will be raised.
     In case error occurs in release mode, `error` will be logged.
     - parameter to: Target publish relays for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer.
     */
    private func bind(to relays: [ReplayRelay<Element>]) -> Disposable {
        return subscribe { e in
            switch e {
            case let .next(element):
                relays.forEach {
                    $0.accept(element)
                }
            case let .error(error):
                assertionFailure("Binding error to publish relay: \(error)")
            case .completed:
                break
            }
        }
    }
}
```
