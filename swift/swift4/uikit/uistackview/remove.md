## Remove stackView

```swift
self.stackView.removeArrangedSubview(view)
view.removeFromSuperView()
```

[removeArrangedSubview(_:)](https://developer.apple.com/documentation/uikit/uistackview/1616235-removearrangedsubview)
> This method removes the provided view from the stack’s arrangedSubviews array. The view’s position and size will no longer be managed by the stack view. However, this method does not remove the provided view from the stack’s subviews array; therefore, the view is still displayed as part of the view hierarchy.
> To prevent the view from appearing on screen after calling the stack’s removeArrangedSubview: method, explicitly remove the view from the subviews array by calling the view’s removeFromSuperview() method, or set the view’s isHidden property to true.

[UIStackViewの削除に関しての追加学習](https://ema-hiro.hatenablog.com/entry/20170304/1488618438)
[removeArrangedSubview(_:)](https://developer.apple.com/documentation/uikit/uistackview/1616235-removearrangedsubview)
