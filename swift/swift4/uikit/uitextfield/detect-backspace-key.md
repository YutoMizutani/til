## Detect backspace key entered on UITextField

#### If not empty,

```swift
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if let char = string.cString(using: String.Encoding.utf8) {
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) {
            print("Backspace was pressed")
        }
    }
    return true
}
```

#### Override super method

```swift
class MyTextField: UITextField {
    override public func deleteBackward() {
        if text == "" {
             // do something when backspace is tapped/entered in an empty text field
        }
        // do something for every backspace
        super.deleteBackward()
    }
}
```

Or use RxSwift,

```swift
extension Reactive where Base: UITextField {
    var deleteBackward: Observable<[Any]> {
        return sentMessage(#selector(base.deleteBackward)).share(replay: 1)
    }
}
```

[Detect backspace Event in UITextField](https://stackoverflow.com/a/29505548)
