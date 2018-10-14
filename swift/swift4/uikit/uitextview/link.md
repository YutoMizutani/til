## Link TextView

```swift
extension UITextView {
    func setAttribute(_ link: String, replaced text: String? = nil) {
        let attributedString = NSMutableAttributedString(string: self.text)
        attributedString.addAttribute(.link,
                                      value: link,
                                      range: NSString(string: self.text).range(of: text ?? self.text))
        self.attributedText = attributedString
    }

    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {

        UIApplication.shared.open(URL)

        return false
    }
}
```

[UITextViewにタップ可能なリンクを挿入する](https://qiita.com/shtnkgm/items/3c8b6b794219fbf087ba)
