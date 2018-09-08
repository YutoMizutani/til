## Display privious image with ImageView in Cell

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = super.tableView(tableView, cellForRowAt: indexPath)
     cell.imageView.image = nil
     return cell
}
```

[UITableviewのセルが再利用される際に前の画像などが残ってしまう場合の対処](https://ja.stackoverflow.com/questions/27845/uitableview%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%8C%E5%86%8D%E5%88%A9%E7%94%A8%E3%81%95%E3%82%8C%E3%82%8B%E9%9A%9B%E3%81%AB%E5%89%8D%E3%81%AE%E7%94%BB%E5%83%8F%E3%81%AA%E3%81%A9%E3%81%8C%E6%AE%8B%E3%81%A3%E3%81%A6%E3%81%97%E3%81%BE%E3%81%86%E5%A0%B4%E5%90%88%E3%81%AE%E5%AF%BE%E5%87%A6)
