## Rx placeholder

ローディング時のplaceholderなど

```swift
Observable.concat(loader.loadImage(with: localUrl).orEmpty,
                  loader.loadImage(with: networkUrl).orEmpty)
    .take(1)
    .observeOn(MainScheduler.instance)
    .subscribe(onNext: { imageView.image = $0 })
    .disposed(by: disposeBag)
```

[Introducing RxNuke](http://kean.github.io/post/introducing-rxnuke)
