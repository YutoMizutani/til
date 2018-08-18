## Differences

> - PublishSubject: Starts empty and only emits new elements to subscribers.
> - BehaviorSubject: Starts with an initial value and replays it or the latest element to new subscribers.
> - ReplaySubject: Initialized with a buffer size and will maintain a buffer of elements up to that size and replay it to new subscribers.
> - Variable: Wraps a *BehaviorSubject*, preserves its current value as state, and replays only the latest/initial value to new subscribers.

[RxSwift: Reactive Programming with Swift, Second Edition](http://a.co/fUizj23)
[RxCocoa 4 の Signal と Relay のまとめ](https://tech.mercari.com/entry/2017/12/04/103247)
