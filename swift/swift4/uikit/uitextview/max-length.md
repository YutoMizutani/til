## Maxmun length in UITextView

```swift
import RxCocoa
import RxSwift

textView.rx.didChange.asObservable()
    .subscribe(onNext: { [weak self] in
        guard let self = self, let textView = self.textView else { return }
        let isTextPredicting = textView.markedTextRange != nil
        let max: Int
        if !isTextPredicting && textView.text.count > max {
            textView.text = String(textView.text.prefix(max))
        }
    })
    .disposed(by: disposeBag)
```

[[iOS] UITextFieldの最大文字数を設定する](http://chicketen.blog.jp/archives/50002171.html)
