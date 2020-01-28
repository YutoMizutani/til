## Disable options in SwiftLint

```swift
// swiftlint:disable:next force_cast
let noWarning = NSNumber() as! Int
let hasWarning = NSNumber() as! Int
let noWarning2 = NSNumber() as! Int // swiftlint:disable:this force_cast
let noWarning3 = NSNumber() as! Int
// swiftlint:disable:previous force_cast
```

[[SwiftLint]コードの中で無効にするルールを指定する](https://qiita.com/akatsuki174/items/13033ec34b6bcd880dfd)
