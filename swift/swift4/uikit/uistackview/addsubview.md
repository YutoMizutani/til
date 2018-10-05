## AddSubView using UIStackView

UIStackView has 2 methods of adding subviews,

- `.addSubView(<#T##view: UIView##UIView#>)`
- `.addArrangedSubview(<#T##view: UIView##UIView#>)`

#### `.addArrangedSubview(<#T##view: UIView##UIView#>)`

If you use it, added subviews are auto-stacked the stack view.
`addSubView` is normaly the

#### Usage

```swift
let stackView = UIStackView()
let view = UIView()
stackView.addArrangedSubview(view)
```

#### References

[[iOS9]UIStackViewについて](https://qiita.com/kaway/items/54d750f2cc5b7c7465e5)
