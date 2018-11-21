## Lock

```swift
class MyObject {
    let lock = NSLock()

    // ...

    func readDataRange(range: Range<Int>) -> NSData? {
        self.lock.lock()
        defer { self.lock.unlock() }  // unlock を保証

        let data = // 読み込み処理
        return data
    }

    func writeData(data: NSData, range: Range<Int>) {
        self.lock.lock()
        defer { self.lock.unlock() }  // unlock を保証

        // 書き込み処理
    }
}
```

[Swift 世代の排他制御](https://qiita.com/codelynx/items/0ecd28c8a7da0a0e42b5)
