## XibLoadable

```swift
import UIKit

private extension NSObject {
    /// 継承を越えて現在のクラス名を取得する
    static var className: String? {
        return NSStringFromClass(self).components(separatedBy: ".").last
    }
}

/// Xib の読み込みが可能な protocol
public protocol XibLoadable {
    associatedtype T = Self where T: UIView

    /// クラス名と一致した Xib ファイルを読み出す
    static var xib: T? { get }
}

public extension XibLoadable where Self: UIView {
    /// クラス名と一致した Xib ファイルを読み出す
    static var xib: T? {
        guard let className = className else { return nil }
        return Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as? T
    }
}

extension UIView: XibLoadable {}
```

[A Swift protocol requirement that can only be satisfied by using a final class](https://stackoverflow.com/questions/37141067/a-swift-protocol-requirement-that-can-only-be-satisfied-by-using-a-final-class/37141531)
[Self, protocol extension and non-final class](https://stackoverflow.com/questions/37552955/self-protocol-extension-and-non-final-class/37555215)
