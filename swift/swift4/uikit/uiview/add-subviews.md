## Add Subviews

```swift
import UIKit

extension UIView {
    /// Add subview with optional
    func addSubview(_ views: UIView?...) {
        views.filter { $0 != nil }.map { $0! }.forEach { addSubview($0) }
    }
}
```
