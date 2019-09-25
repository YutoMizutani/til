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
