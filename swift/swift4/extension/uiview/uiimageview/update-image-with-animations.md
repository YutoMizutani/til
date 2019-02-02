## Update image with animations on UIImageView

```swift
import UIKit

extension UIImageView {
    /// Update image with animations
    func updateImage(_ image: UIImage?,
                     duration: TimeInterval = 0.75,
                     options: UIView.AnimationOptions = .transitionCrossDissolve,
                     animated: Bool = true,
                     completion: ((Bool) -> Void)? = nil) {
        guard animated else { self.image = image; return }
        UIView.transition(with: self,
                          duration: duration,
                          options: options,
                          animations: { self.image = image },
                          completion: completion)
    }
}
```

[How to animate the change of image in an UIImageView?](https://stackoverflow.com/questions/2834573/how-to-animate-the-change-of-image-in-an-uiimageview)
