## Optional init

## String? to Int?

```swift
extension Int {
    init?(_ source: String?) {
        guard let source = source,
            let impl = Int(source) else {
            return nil
        }
        self = impl
    }
}
```

## Int? to String?

```swift
extension String {
    init?(_ source: Int?) {
        guard let source = source else {
            return nil
        }
        self = "\(source)"
    }
}
```

[Swiftとイニシャライザ](https://qiita.com/shtnkgm/items/8b7979fc84a3cc065238)
[init(_:) - Apple documentation](https://developer.apple.com/documentation/swift/fixedwidthinteger/2927496-init)
