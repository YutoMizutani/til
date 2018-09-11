## Cell height automatically

`tableView.estimatedRowHeight` に対しても `UITableViewAutomaticDimension` を指定することができる。

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = UITableViewAutomaticDimension
}
```

[UITableViewのrowHeightやestimatedRowHeightに何を設定すると良いのか](https://qiita.com/masashi-sutou/items/bb8ac89c717dcbe56123)
[UITableView上に可変するUITextViewを作る](https://qiita.com/mishimay/items/619f9ce60b4fabc1612f)
