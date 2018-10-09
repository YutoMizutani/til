## Wait

```swift
let expect = self.expectation(description: "foo")

() {
    expect.fulfill()
}

self.wait(for: [expect], timeout: 10)
```

[iOSで非同期処理のテスト: XCTestExpectationの設定値と使い方まとめ](https://qiita.com/ktanaka117/items/e452e5ca58545c303dc2)
