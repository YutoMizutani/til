## distinctUntilWordPrediction

```swift
extension ObservableType where E: Equatable {
    /// 日本語入力変換中は流さない
    func distinctUntilWordPrediction(_ textView: UITextView)
        -> Observable<E> {
            return self.filter({ _ in textView.markedTextRange == nil })
    }
}
```

[UITextFieldで文字列が変換中かどうかを調べる](https://qiita.com/hidekuro/items/284e822057effc9aa726)
