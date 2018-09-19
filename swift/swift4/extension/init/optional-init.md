## Optional init

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

[](https://qiita.com/shtnkgm/items/8b7979fc84a3cc065238)
