## Expand hit area extension in UIButton

```swift
private var _insets: Dictionary<String, UIEdgeInsets> = Dictionary()
private var insetIdentifers: Dictionary<UIButton, String> = Dictionary()
extension UIButton {
    /// タップ領域の延長を指定する。
    func setExpandInsets(_ identifer: String) {
        insetIdentifers[self] = identifer
    }
    /// タップ領域の延長を指定する。
    func setExpandInsets(_ insets: UIEdgeInsets, identifer: String) {
        _insets[identifer] = insets
        insetIdentifers[self] = identifer
    }
    /// タップ領域の延長を初期化する。
    func removeExpandInsets() {
        guard let identifer = insetIdentifers[self] else { return }
        _insets[identifer] = nil
        insetIdentifers[self] = nil
    }

    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        // タップエリア調整
        var rect = self.bounds
        let identifer: String? = insetIdentifers[self]
        let insets: UIEdgeInsets = identifer != nil ? _insets[identifer!] ?? UIEdgeInsets.zero : UIEdgeInsets.zero
        rect.origin.x -= insets.left
        rect.origin.y -= insets.top
        rect.size.width += insets.left + insets.right
        rect.size.height += insets.top + insets.bottom

        // 拡張したViewサイズがタップ領域に含まれているかどうか
        return rect.contains(point)
    }
}
```

[【iOS】UIButtonのタップ領域だけを拡大する](https://qiita.com/KokiEnomoto/items/264f26bfa92d06b1996e)
