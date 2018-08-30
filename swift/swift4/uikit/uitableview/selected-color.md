## Selected Cell color in UITableView

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.selectionStyle = .none
    return cell
}
```

[UITableViewCell選択時に色を変えない](http://jack-n-coke.hatenablog.com/entry/2014/02/24/125723)
