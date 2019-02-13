## Touch events

```swift
import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UIButton {
    /// Reactive wrapper for `TouchDown` control event.
    var touchDown: ControlEvent<Void> {
        return controlEvent(.touchDown)
    }

    /// Reactive wrapper for `TouchUpInside` control event.
    var touchUpInside: ControlEvent<Void> {
        return controlEvent(.touchUpInside)
    }
}
```
