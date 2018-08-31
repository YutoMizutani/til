## Run after tableView.reloadData()

```swift
extension UITableView {
    public func reloadData(_ completion: @escaping (Bool) -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { bool in
            completion(bool)
        })
    }
}
```

#### Usage

```swift
tableView.reloadData { isFinished in
    guard isFinished else { return }
    // do
}
```

[reloadData処理後に処理を行いたい](https://qiita.com/ponkichi4/items/d5d46556773a6bc98f9c)
[SwifterSwift/SwifterSwift/Sources/Extensions/UIKit/UITableViewExtensions.swift](https://github.com/SwifterSwift/SwifterSwift/blob/master/Sources/Extensions/UIKit/UITableViewExtensions.swift)
