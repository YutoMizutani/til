## Make view using closure

Closureを利用したUIView作成のTip

利点として，Closure内の変数名が競合しないことにより，複数の設定を同じ変数名で書くことが可能。

```swift
let button: UIButton = { () -> UIButton in
    let button = UIButton()
    button.setTitle("", for: .normal)
    button.setTitleColor(UIColor.red, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    return button
}()
self.view.addSubview(button)
```
