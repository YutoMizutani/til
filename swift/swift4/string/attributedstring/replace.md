## Replace in NSAttributedString

```swift
extension NSAttributedString {
    func replacingOccurrences(of pattern: String, with replacement: String) -> NSMutableAttributedString {
        let mutableAttributedString = self.mutableCopy() as! NSMutableAttributedString
        let mutableString = mutableAttributedString.mutableString
        while mutableString.contains(pattern) {
            let range = mutableString.range(of: pattern)
            mutableAttributedString.replaceCharacters(in: range, with: replacement)
        }
        return mutableAttributedString
    }
}
```

[Swift で NSAttributedString 内の部分文字列を別の文字列に置換する方法](http://xyk.hatenablog.com/entry/2017/10/03/113826)
