## Function builder

> [SwiftUIの魔法を実現する仕組み (Custom Attributes, Function Builder)](https://qiita.com/kentrino/items/dc6e77a0ddd21187cc55)

```swift
@_functionBuilder public struct BlockAdder {
    public static func buildBlock(_ a: Int) -> Int {
        return a
    }

    public static func buildBlock(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    public static func buildBlock(_ a: Int, _ b: Int, _ c: Int) -> Int {
        return a + b + c
    }

    public static func buildBlock(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int {
        return a + b + c + d
    }
}
```

```swift
func blockAdd(@BlockAdder block: () -> Int) -> Int {
    return block()
}
```

```swift
blockAdd {
    3
    4
}
```

[SwiftUIの魔法を実現する仕組み (Custom Attributes, Function Builder)](https://qiita.com/kentrino/items/dc6e77a0ddd21187cc55)
[Preliminary support for function builders #25221](https://github.com/apple/swift/pull/25221)
[Function builders](https://forums.swift.org/t/function-builders/25167)
[ViewBuilder - Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/viewbuilder)
