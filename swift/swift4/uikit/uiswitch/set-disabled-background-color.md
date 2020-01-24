## Set disabled background color on UISwitch

```swift
if #available(iOS 13.0, *) {
    self.sw.subviews[0].subviews[0].backgroundColor = .green
} else if #available(iOS 12.0, *) {
    self.sw.subviews[0].subviews[0].subviews[0].backgroundColor = .green
}
```

[Change color of UISwitch in “off” state](https://stackoverflow.com/a/58142728)
