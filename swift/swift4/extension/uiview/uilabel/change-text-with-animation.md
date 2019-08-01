## Change text with animation on UILabel

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
```

[Animate text change in UILabel](https://stackoverflow.com/questions/3073520/animate-text-change-in-uilabel/16367409)
