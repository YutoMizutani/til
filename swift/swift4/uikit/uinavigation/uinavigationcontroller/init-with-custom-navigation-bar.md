## Init with custom navigation bar

```swift
import UIKit

extension UINavigationController {
    convenience init(rootViewController: UIViewController, navigationBarClass: AnyClass?, toolbarClass: AnyClass? = nil) {
        self.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.setViewControllers([rootViewController], animated: false)
    }
}
```
