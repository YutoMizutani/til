## distinctUntilWordPrediction

```swift
extension ObservableType where E: Equatable {
    /// 日本語入力変換中は流さない
    func distinctUntilWordPrediction(_ textField: UITextField)
        -> Observable<E> {
            return self.filter({ _ in textField.markedTextRange == nil })
    }
}
```
