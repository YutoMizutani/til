## Directives

Swift 4より、`#if`に`canImport(_:)`を利用して判断できるようになった。

```swift
#if canImport(UIKit)
   // UIKit-based code
   #elseif canImport(Cocoa)
   // OSX code
   #elseif
   // Workaround/text, whatever
#endif
```

```swift
#if os(iOS)
   // UIKit-based code
   #elseif os(OSX)
   // OSX code
   #elseif
   // Workaround/text, whatever
#endif
```

[](https://qiita.com/hanawat/items/6e76d958a22b6e77d6ea)
