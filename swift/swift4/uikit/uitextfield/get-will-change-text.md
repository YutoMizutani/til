## Get text will changed on UITextField

`UITextFieldDelegate` と `textField.delegate = self` の指定が必要。

```swift
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let result: String = "\((textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string)"
    let result: String? = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
    // falseの場合は入力をキャンセルできる
    return true
}
```

[Using stringByReplacingCharactersInRange in Swift](https://stackoverflow.com/questions/24015848/using-stringbyreplacingcharactersinrange-in-swift)
