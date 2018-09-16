## Filter

```swift
let disposeBag = DisposeBag()

Observable.of(
    "🍑", "🍐", "🍎",
    "🍇", "🍑", "🍐",
    "🍎", "🍇", "🍑"
    )
    .filter {
        $0 == "🍑" // 🍑だけを流す
    }
    .subscribe { print($0) }
    .addDisposableTo(disposeBag)

/*
Next(🍑)
Next(🍑)
Next(🍑)
Completed
*/
```

[【Swift】RxSwiftのPlaygroundを読む➄](https://qiita.com/KentaKudo/items/c5eefa22706893834c86)
