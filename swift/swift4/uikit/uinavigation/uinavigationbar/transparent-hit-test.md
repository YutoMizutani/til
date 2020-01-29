## Transparent hit test

```swift
class TransparentHitTestNavigationBar: UINavigationBar {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        /// Return view if it has any controls
        guard view as? UIControl == nil else { return view }
        return backgroundColor == nil ? nil : view
    }
}
```

[iphone - UINavigationBarがタッチイベントを盗むのはなぜですか？](https://tutorialmore.com/questions-1033437.htm)
