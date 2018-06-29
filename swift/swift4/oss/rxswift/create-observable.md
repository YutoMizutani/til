## Create observable

一度だけ発火するStream

```swift
let observable: Observable<Void> = Observable.create({ observer in
    print("foo")

    // 処理の完了後に流す。
    observer.onNext()
    observer.onCompleted()

    return Disposables.create()
})
```

```swift
import RxSwift

let disposeBag = DisposeBag()
observable.asObservable()
    .subscribe(onNext: { _ in
        print("bar")
    })
    .disposed(by: disposeBag)

// foo
// bar
```
