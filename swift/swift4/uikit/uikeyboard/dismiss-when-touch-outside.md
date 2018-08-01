## Dismiss when touch outside the keyboard

UIKeyboardの外側をタップすることでキーボードを閉じる。
keyboardTypeがnumberPadである場合など，Return keyのないキーボードの使用時に特に有効。

```swift
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.view.endEditing(true)
}
```

[How to dismiss number pad keyboard by tapping anywhere](https://stackoverflow.com/questions/6991085/how-to-dismiss-number-pad-keyboard-by-tapping-anywhere)
