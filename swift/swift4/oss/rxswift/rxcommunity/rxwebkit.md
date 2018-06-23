## RxWebKit

[RxSwiftCommunity/RxWebKit](https://github.com/RxSwiftCommunity/RxWebKit)
> RxWebKit is a RxSwift wrapper for WebKit

#### Usage

```swift
let webView = WKWebView(frame: self.view.bounds)
self.view.addSubview(webView)


// MARK: Observing properties

webView.rx.title
    .subscribe(onNext: {
        print("title: \($0)")
    })
    .disposed(by: disposeBag)

webView.rx.url
    .subscribe(onNext: {
        print("URL: \($0)")
    })
    .disposed(by: disposeBag)
```

[RxSwiftCommunity/RxWebKit](https://github.com/RxSwiftCommunity/RxWebKit)
