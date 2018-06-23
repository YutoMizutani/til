## RxSwiftExt

[RxSwiftCommunity/RxSwiftExt](https://github.com/RxSwiftCommunity/RxSwiftExt)
> A collection of Rx operators & tools not found in the core RxSwift distribution

RxSwiftの標準に足りないRxパラメータを追加するライブラリ。

## unwrap

```swift
Observable.of(1,2,nil,Int?(4))
  .unwrap()
  .subscribe { print($0) }
```

ignore
ignoreWhen
Observable.once
distinct
map
not
and
Observable.cascade
pairwise, nwise
retry
repeatWithBehavior
catchErrorJustComplete
pausable
pausableBuffered
apply
filterMap
Observable.fromAsync
Observable.zip(with:)
withUnretained

[RxSwiftCommunity/RxSwiftExt](https://github.com/RxSwiftCommunity/RxSwiftExt)
