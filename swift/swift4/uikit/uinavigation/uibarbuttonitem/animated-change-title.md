## Animated change title

```swift
import UIKit

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}

navigationController?.navigationBar.fadeTransition(0.4)
navigationItem.title = "title"
```

[Animate nav bar title text change](https://stackoverflow.com/questions/24543702/animate-nav-bar-title-text-change)
