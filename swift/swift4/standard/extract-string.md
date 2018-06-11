## Extract string

Swiftで文字列の先頭からx文字を抜き出す。

```swift
let text = "Hello, world!!"
let i = 5

let result = String(text[..<text.index(text.startIndex, offsetBy: i)])
// Hello
```

Extensionを作ってしまった方が便利。

```swift
extension String: CollectironType {
  func until(_ i: Int) -> String {
    return String(self[..<self.index(self.startIndex, offsetBy: i)])
  }
}
```

[Swiftで競技プログラミング](https://qiita.com/touyoubuntu/items/1d8a9c00a283e98bc8e4)
