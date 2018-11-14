# Additional valued enum in Swift

```swift
enum Enum {
    case foo
    case bar
}

extension Enum { // Compile error occurred
    case baz
}
```

```swift
struct Directions: OptionSet {
    let rawValue: UInt8
    init(rawValue: UInt8) { self.rawValue = rawValue }
    static let up = Directions(rawValue: 0b00000000)
}
extension Directions {
    static let down = Directions(rawValue: 0b00000001)
}

print(Directions.down.rawValue) // 1
```

[RawRepresentable | Apple Developer](https://developer.apple.com/documentation/swift/rawrepresentable)
[SwiftでOptionSet](https://qiita.com/KentaKudo/items/149c5672b0ee246f63c1)
[Adding a case to an existing enum with a protocol](https://stackoverflow.com/questions/34025674/adding-a-case-to-an-existing-enum-with-a-protocol)
[Enumerations | Swift doc](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
[UserDefaultsをSwiftのEnumで扱えるように拡張する](http://blog.matsuokah.jp/entry/2017/10/01/190050)
