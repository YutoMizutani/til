## Scroll to zero

```swift
extension UIScrollView {
    public enum ScrollDirection {
        case top
        case bottom
        case left
        case right
    }

    public func scroll(to direction: ScrollDirection, animated: Bool) {
        let offset: CGPoint
        switch direction {
        case .top:
            offset = CGPoint(x: contentOffset.x, y: -contentInset.top)
        case .bottom:
            offset = CGPoint(x: contentOffset.x, y: max(-contentInset.top, contentSize.height - frame.height + contentInset.bottom))
        case .left:
            offset = CGPoint(x: -contentInset.left, y: contentOffset.y)
        case .right:
            offset = CGPoint(x: max(-contentInset.left, contentSize.width - frame.width + contentInset.right), y: contentOffset.y)
        }
        setContentOffset(offset, animated: animated)
    }
}
```

[UIScrollViewで一番上/下/左/右までスクロールさせるextensionを書いた](https://tech-blog.sgr-ksmt.org/2016/11/11/uiscrollview_scroll_extension/)
