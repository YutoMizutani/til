## Empty data observable

一方が空要素または "初回" 読み込み中であった際に差し替える empty data のObservable

```swift
let emptyDataObservable: Observable<T>
let optionalObservable: Observable<T?>
Observable.merge(emptyDataObservable.takeUntil(optionalObservable).map { Optional($0) }, optionalObservable)
            .withLatestFrom(emptyDataObservable) { $0 ?? $1 }
```
