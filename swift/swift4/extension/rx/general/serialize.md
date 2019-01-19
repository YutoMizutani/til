## Serialize

```swift
import RxSwift

extension Observable {
    /// Rxの世界から直列に値を取りだす。
    /// waitにタイムアウトを使用していないため，非同期処理の中にタイムアウトを使用していないと断言できない場合以外は使用してはならない。
    func serialize() -> Element? {
        var element: Element?
        let semaphore = DispatchSemaphore(value: 0)

        _ = subscribe(onNext: { e in
                element = e
                semaphore.signal()
            },
            onError: { _ in semaphore.signal() },
            onCompleted: { semaphore.signal() }
        ) {
            semaphore.signal()
        }

        semaphore.wait()
        return element
    }
}
```

[Swiftで同期HTTP通信を走らせる](https://53ningen.com/synchronous-http-request-swift/)
[RxSwift: ObservableをSequenceで同期処理に変更する](https://qiita.com/hikarin522/items/187d48b25d9367170a51)
