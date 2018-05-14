## willSet/didSet

newValue/oldValueで値を取得可能。

```swift
var x: Int {
  willSet {
    print(newValue)
  }
  didSet {
    print(oldValue)
  }
}
```
