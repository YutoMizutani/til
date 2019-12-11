## Disable background color hidden on UIView when UITableViewCell tapped

Keep the color before calling super method and restore after
BackgroundColor issue is occurred only UIView object

```swift
class MyCell: UITableViewCell {
    @IBOutlet var myView: UIView!

    override func setHighlighted(highlighted: Bool, animated: Bool) {
        let myViewBackgroundColor = myView.backgroundColor
        super.setHighlighted(highlighted, animated: animated)
        myView.backgroundColor = myViewBackgroundColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        let myViewBackgroundColor = myView.backgroundColor
        super.setSelected(selected, animated: animated)
        myView.backgroundColor = myViewBackgroundColor
    }
}
```

[UIView backgroundColor disappears when UITableViewCell is selected
](https://stackoverflow.com/a/21661997)
