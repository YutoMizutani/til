## Extract string

Swiftで文字列の先頭からx文字を抜き出す。

```swift
let text = "Hello, world!!"
let i = 5

let result = String(text[..<text.index(text.startIndex, offsetBy: i)])
// Hello
```
