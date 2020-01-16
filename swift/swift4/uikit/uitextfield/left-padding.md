## Left padding on UITextField

```swift
let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
textField.leftView = paddingView
textField.leftViewMode = .always
```

[Set padding for UITextField with UITextBorderStyleNone](https://stackoverflow.com/questions/3727068/set-padding-for-uitextfield-with-uitextborderstylenone)
