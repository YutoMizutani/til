## Underscore in Swift

```swift
func f() -> String {
    return ""
}
f()
```

このままでは`Result of call to 'f()' is unused`というWarningが発生する。
実行には影響はないが、警告を消したい。

解決方法は2つ。

#### _ (Underscore)

`_`を用いて返り値を破棄する。

```swift
_ = f()
```

#### @discardableResult

`@discardableResult`キーワードを付加して宣言することにより、
返り値が破棄される可能性を明示できる。

```swift
@discardableResult func f() -> String {
    return ""
}
f()
```

[Swiftの `_` (アンダースコア)](https://qiita.com/mono0926/items/2eb40d58275d20e89ac8)
