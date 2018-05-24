## Document comment

#### 関数コメント

`/** */`または`///`でコメントにドキュメントを表示させることができる。

```swift
/**
 quux

 - Parameters:
    - bar: corge
    - baz: grault

 - Returns:
    garply
 */
func foo(bar: String, baz: String) -> String {
    let qux = ""
    return qux
}
```

```swift
/// quux
func foo(bar: String, baz: String) -> String {
    let qux = ""
    return qux
}
```

#### Xcode comment

```swift
// MARK:
// MARK:-
// TODO:
// FIXME:
```

[Markup Formatting Reference](https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html)
