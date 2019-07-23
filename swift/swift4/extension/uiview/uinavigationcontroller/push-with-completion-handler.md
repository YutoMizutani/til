## Push with Completion handler for UINavigationController

```swift
import UIKit

extension UINavigationController {
    func pushViewController(viewController: UIViewController,
                            animated: Bool,
                            completion: @escaping (() -> Void) = {}) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
}
```

[Completion handler for UINavigationController “pushViewController:animated”?](https://stackoverflow.com/questions/9906966/completion-handler-for-uinavigationcontroller-pushviewcontrolleranimated)
