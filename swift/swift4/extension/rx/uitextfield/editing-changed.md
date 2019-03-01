## editingChanged using RxSwift

```swift
textField.rx.controlEvent(.editingChanged).asObservable()
    .map { textField.text ?? "" }
```

[Observing UITextField.editing with RxSwift](https://stackoverflow.com/questions/39627440/observing-uitextfield-editing-with-rxswift)
[How do I check when a UITextField changes?](https://stackoverflow.com/questions/28394933/how-do-i-check-when-a-uitextfield-changes/40853282)
