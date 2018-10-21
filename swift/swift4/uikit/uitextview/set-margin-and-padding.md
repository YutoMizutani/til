## Set padding on UITextView

```swift
let textView = UITextView()
textView.textContainerInset = UIEdgeInsets.zero
textView.textContainer.lineFragmentPadding = 0
```

[How to lose margin/padding in UITextView?](https://stackoverflow.com/questions/746670/how-to-lose-margin-padding-in-uitextview)
> ```swift
> @IBDesignable class UITextViewFixed: UITextView {
>   override func layoutSubviews() {
>       super.layoutSubviews()
>       setup()
>   }
>   func setup() {
>       textContainerInset = UIEdgeInsets.zero
>       textContainer.lineFragmentPadding = 0
>   }
> }
> ```

[How to lose margin/padding in UITextView?](https://stackoverflow.com/questions/746670/how-to-lose-margin-padding-in-uitextview)
