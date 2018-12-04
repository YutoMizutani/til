## Store previous value

```swift
func store(startWith: Self.E) -> Observable<(currentValue: E, previousValue: E)> {
    return Observable.zip(self, self.startWith(startWith)).map { (currentValue: $0.0, previousValue: $0.1) }
}

func store() -> Observable<(currentValue: E, previousValue: E?)> {
    return Observable.zip(self, self.map(Optional.init).startWith(nil)).map { (currentValue: $0.0, previousValue: $0.1) }
}
```

[RxSwift :: ひとつ前の値をタプルで取得できるようにする](https://medium.com/tipstack-ios/rxswift-ひとつ前の値をタプルで取得できるようにする-6aba8ec5c0bf)
[RxSwiftで一つ前の値と現在の値を両方Subscribeする方法](https://qiita.com/touyu/items/d01067d141ebd2fbb037)
