
```swift
import UIKit.UIGestureRecognizerSubclass

class UITouchesBeganGestureRecognizer: UIGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if state == .possible {
            state = .recognized
        }
    }
}

#if canImport(RxSwift) && canImport(RxCocoa)

import RxCocoa
import RxSwift

extension Observable where Element: UITouchesBeganGestureRecognizer {
    func when(_ state: UIGestureRecognizer.State) -> Observable<Element> {
        return filter { $0.state == state }
    }
}

extension Reactive where Base: UIView {
    var touchesBeganGesture: Observable<UITouchesBeganGestureRecognizer> {
        let touchesBeganGestureRecognizer = UITouchesBeganGestureRecognizer()
        touchesBeganGestureRecognizer.cancelsTouchesInView = false
        base.addGestureRecognizer(touchesBeganGestureRecognizer)
        return touchesBeganGestureRecognizer.rx.event.do(onDispose: {
            self.base.removeGestureRecognizer(touchesBeganGestureRecognizer)
        })
    }
}

extension Reactive where Base: UIButton {
    var touchesBeganGesture: Observable<UITouchesBeganGestureRecognizer> {
        let touchesBeganGestureRecognizer = UITouchesBeganGestureRecognizer()
        touchesBeganGestureRecognizer.cancelsTouchesInView = false
        base.addGestureRecognizer(touchesBeganGestureRecognizer)
        return touchesBeganGestureRecognizer.rx.event.do(onDispose: {
            self.base.removeGestureRecognizer(touchesBeganGestureRecognizer)
        })
    }
}

#endif
```

[UITapGestureRecognizer - make it work on touch down, not touch up?](https://stackoverflow.com/questions/15628133/uitapgesturerecognizer-make-it-work-on-touch-down-not-touch-up/15629234)
