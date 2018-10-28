## rx.location property

```swift
extension Reactive where Base: UITextView {
    /// Reactive wrapper for `location` property.
    var location: ControlProperty<Int?> {
        let source: Observable<Int?> = Observable.deferred { [weak textView = self.base] in
            let selectedRange = textView?.selectedRange

            let textChanged: Observable<Int?> = textView?.textStorage
                // This project uses text storage notifications because
                // that's the only way to catch autocorrect changes
                // in all cases. Other suggestions are welcome.
                .rx.didProcessEditingRangeChangeInLength
                // This observe on is here because text storage
                // will emit event while process is not completely done,
                // so rebinding a value will cause an exception to be thrown.
                .observeOn(MainScheduler.asyncInstance)
                .map { _ in
                    return textView?.selectedRange.location
                }
                ?? Observable.empty()

            return textChanged
                .startWith(selectedRange?.location)
        }

        let bindingObserver = Binder(self.base) { (textView, location: Int?) in
            // This check is important because setting text value always clears control state
            // including marked text selection which is imporant for proper input
            // when IME input method is used.
            if let location = location, textView.selectedRange.location != location {
                textView.selectedRange.location = location
            }
        }

        return ControlProperty(values: source, valueSink: bindingObserver)
    }
}
```

[RxSwift/RxCocoa/iOS/UITextView+Rx.swift](https://github.com/ReactiveX/RxSwift/blob/master/RxCocoa/iOS/UITextView%2BRx.swift)
