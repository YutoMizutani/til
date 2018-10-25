## Get tableiew from the cell

```swift
import UIKit

fileprivate extension UIView {
    func parentView<T: UIView>(of type: T.Type) -> T? {
        guard let view = self.superview else {
            return nil
        }
        return (view as? T) ?? view.parentView(of: T.self)
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return self.parentView(of: UITableView.self)
    }
}
```

[[Iphone] How to get UITableView from UITableViewCell?](https://code.i-harness.com/en/q/efbd9d)
