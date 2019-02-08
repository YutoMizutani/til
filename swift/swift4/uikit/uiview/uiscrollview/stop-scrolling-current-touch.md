## Stop scrolling in current touch in UIScrollView

```swift
import UIKit

extension UIScrollView {
    /// 現在のタップによるスクロールをキャンセルする
    func cancelScrollDuringCurrentTouch() {
        panGestureRecognizer.isEnabled = false
        panGestureRecognizer.isEnabled = true
    }
}
```

[現在のUIScrollViewのタッチをキャンセルする](https://stackoverrun.com/ja/q/5043756)
