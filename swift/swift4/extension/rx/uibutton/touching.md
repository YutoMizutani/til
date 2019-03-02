## Touching state on UIButton using RxSwift

UIButton's `touchesDown` event is too slow and sometimes not recognized, so merged `touchesDown` and default removable touch events and mapped.

It is using `[touchesbegan-gesture.md](https://github.com/YutoMizutani/til/blob/master/swift/swift4/extension/uiview/uigesturerecognizer/touchesbegan-gesture.md)` property.

```swift
import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UIButton {
    /// The state of touching
    var touching: Observable<Bool> {
        return Observable.merge(touchesBeganGesture.when(.recognized).map { _ in true },
                                Observable.merge(touchUpInside.asObservable(),
                                                 touchCancel.asObservable(),
                                                 touchDragExit.asObservable(),
                                                 touchUpOutside.asObservable()).map { _ in false })
            .distinctUntilChanged()
            .share(replay: 1)
    }

    /// Reactive wrapper for `TouchUpInside` control event.
    var touchUpInside: ControlEvent<Void> {
        return controlEvent(.touchUpInside)
    }

    /// Reactive wrapper for `TouchCancel` control event.
    var touchCancel: ControlEvent<Void> {
        return controlEvent(.touchCancel)
    }

    /// Reactive wrapper for `TouchDragExit` control event.
    var touchDragExit: ControlEvent<Void> {
        return controlEvent(.touchDragExit)
    }

    /// Reactive wrapper for `TouchUpOutside` control event.
    var touchUpOutside: ControlEvent<Void> {
        return controlEvent(.touchUpOutside)
    }
}
```

[touchesbegan-gesture.md](https://github.com/YutoMizutani/til/blob/master/swift/swift4/extension/uiview/uigesturerecognizer/touchesbegan-gesture.md)
