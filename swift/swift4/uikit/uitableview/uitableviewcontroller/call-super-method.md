## Call super methods in UITableViewCellController

```swift
class FooTableViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        super.tableView(tableView, willDisplay: cell, forRowAt: indexPath) // FATAL ERROR
    }
}
```

UITableViewController class is `UIViewController + UITableViewDelegate + UITableViewDataSource`,
BUT the class has no content delegate methods, so *CRASH* if you call `super` functions in delegate methods.

[Do I need to call super when overriding data source and delegate methods in UITableViewController?](https://stackoverflow.com/questions/32944647/do-i-need-to-call-super-when-overriding-data-source-and-delegate-methods-in-uita)
