## Paste animation bug in iOS 11

```swift
let textView: UITextView
if #available(iOS 11.0, *) {
    textView.pasteDelegate = self
}

extension TextView: UITextPasteDelegate {
    /// iOS 11 paste animation bug
    /// - SeeAlso: https://stackoverflow.com/questions/51770900/uitextview-stange-animation-glitch-on-paste-action-ios11
    @available(iOS 11.0, *)
    func textPasteConfigurationSupporting(_ textPasteConfigurationSupporting: UITextPasteConfigurationSupporting, shouldAnimatePasteOf attributedString: NSAttributedString, to textRange: UITextRange) -> Bool {
        return false
    }
}
```

[UITextView stange animation glitch on paste action (iOS11)](https://stackoverflow.com/questions/51770900/uitextview-stange-animation-glitch-on-paste-action-ios11)
[Animation glitch when pasting](https://github.com/louisdh/textor/issues/1)
[https://twitter.com/twostraws/status/972914692195790849](https://twitter.com/twostraws/status/972914692195790849)
