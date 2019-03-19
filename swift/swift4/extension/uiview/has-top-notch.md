## Has top notch (iPhone X*)

```swift
import UIkit

extension UIApplication {
    /// 上部ノッチを保有しているか -> X系端末であるか
    static var hasTopNotch: Bool {
        if #available(iOS 11.0, *) {
            // with notch: 44.0 on iPhone X, XS, XS Max, XR.
            // without notch: 24.0 on iPad Pro 12.9" 3rd generation, 20.0 on iPhone 8 on iOS 12+.
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 24
        }
        return false
    }
}
```

[Detect if the device is iPhone X](https://stackoverflow.com/questions/46192280/detect-if-the-device-is-iphone-x/47067296)
