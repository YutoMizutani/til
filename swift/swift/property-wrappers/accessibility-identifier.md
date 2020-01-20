## AccessibilityIdentifier

```swift
import UIKit

protocol AccessibilityIdentifierConvertible {
    func setAccessibilityIdentifier(_ identifier: String?)
}

@propertyWrapper
struct AccessibilityIdentifier<V: AccessibilityIdentifierConvertible> {
    private var value: V!
    private var identifier: String?

    var wrappedValue: V {
        get { value }
        set {
            value = newValue
            value.setAccessibilityIdentifier(identifier)
        }
    }

    init(wrappedValue: V) {
        self.wrappedValue = wrappedValue
    }

    init(_ identifier: String) {
        self.identifier = identifier
    }
}

extension UIView: AccessibilityIdentifierConvertible {
    func setAccessibilityIdentifier(_ identifier: String?) {
        accessibilityIdentifier = identifier
    }
}

extension Optional: AccessibilityIdentifierConvertible where Wrapped: UIView {
    func setAccessibilityIdentifier(_ identifier: String?) {
        switch self {
        case .some(let wrapped):
            wrapped.accessibilityIdentifier = identifier
        case .none:
            break
        }
    }
}
```

### Usage

```swift
@AccessibilityIdentifier("button")
@IBOutlet private var button: UIButton!
```
