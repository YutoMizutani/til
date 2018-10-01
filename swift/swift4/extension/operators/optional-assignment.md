## Optional Assignment Operator

```swift
infix operator ?=

func ?=<T> (lhs: inout T, rhs: T?) {
    if let rhs = rhs {
        lhs = rhs
    }
}
```

["右辺値がnilでなければ左辺値に代入する"演算子を定義する](https://qiita.com/masahiko24/items/b6e399804f016be3dc0a)
[[Swift3] precedencegroup assignment属性の役割](https://qiita.com/ysn551/items/f9ecf2ed9c9226c7105e)
