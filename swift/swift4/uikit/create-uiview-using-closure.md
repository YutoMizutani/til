## Create UIView using closure on Swift

closureを利用してUIViewを作成すると，Viewの作成時に変数名を固定できる(どのボタンをいくつ生成する場合においても，常に`let button`で宣言できる)。

```swift
let fooButton = { () -> UIButton in
    let button = UIButton()
    // タイトル
    button.setTitle("foo", for: .normal)
    // 文字色
    button.setTitleColor(UIColor(red: 0, green: 0, blue: 1, alpha: 1), for: .normal)
    button.setTitleColor(UIColor(red: 0, green: 0, blue: 1, alpha: 0.2), for: .highlighted)
    // フォント
    button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    // テスト用の識別子
    button.accessibilityIdentifier = "Button"
    return button
}()
self.addSubview(self.fooButton)
```
