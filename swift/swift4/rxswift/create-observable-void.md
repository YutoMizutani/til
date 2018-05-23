## Create Observable<Void>

RxSwiftでVoidのObservable<Void>を作成する方法。

```swift
import RxSwift

var observable: Observable<Void> {
    return Observable.create({ observer -> Disposable in
        observer.onNext(())
        observer.onCompleted()

        return Disposables.create()
    })
}
```

#### 余談

onNext(())をprotocol extensionでラップしてあげてすっきりさせると幸せ。

```swift
import RxSwift

extension ObserverType where E == Void {
    public func onNext() {
        onNext(())
    }
}

var observable: Observable<Void> {
    return Observable.create({ observer -> Disposable in
        observer.onNext()
        observer.onCompleted()

        return Disposables.create()
    })
}
```

[RxSwiftでObservable<Void>をonNext()する方法](http://blog.a-azarashi.jp/entry/2018/01/14/232645)
