## Contain view

```swift
import UIKit

/// Xib の再生成を助ける Property Wrapper
@propertyWrapper
struct Contained<V, C: UIView> {
    private var value: V!
    let containedView: C

    public var wrappedValue: V {
        get { value }
        set {
            value = newValue
            addSubview()
        }
    }

    public init(view: C) {
        containedView = view
    }

    private func addSubview() {
        guard let view = value as? UIView else {
            fatalError("Could not to use without UIView")
        }

        guard view.subviews.allSatisfy({ $0 is C }) else { return }
        view.addSubview(containedView)
        containedView.translatesAutoresizingMaskIntoConstraints = false
        containedView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containedView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containedView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containedView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
```

## Usage

```swift
@Contained(view: HomeView())
@IBOutlet private var homeViewContainer: UIView!
```
