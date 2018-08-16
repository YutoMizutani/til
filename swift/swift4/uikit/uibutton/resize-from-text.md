## Resize from text

Fixed text and font size, resize UIButton automatically without font size change.

```swift
extension UIButton {
    override open var intrinsicContentSize: CGSize {
        let margin: (width: CGFloat, height: CGFloat) = (0, 0)
        let intrinsicContentSize = super.intrinsicContentSize
        let adjustedWidth = intrinsicContentSize.width + titleEdgeInsets.left + titleEdgeInsets.right + margin.width * 2
        let adjustedHeight = intrinsicContentSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom + margin.height * 2
        return CGSize(width: adjustedWidth, height: adjustedHeight)
    }
}
```

[[Ios] Autolayout - UIButtonの本来のサイズにはタイトルインセットは含まれていません](https://code.i-harness.com/ja/q/10f9c60)
