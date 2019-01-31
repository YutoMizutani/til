## Set image with animation

```swift
let toImage = UIImage(named:"myname.png")
UIView.transition(with: self.imageView,
                  duration: 0.3,
                  options: .transitionCrossDissolve,
                  animations: {
                      self.imageView.image = toImage
                  },
                  completion: nil)
```

[ios アニメーション swift - UIImageViewの画像を変更するとフェード/ディゾルブする](https://code.i-harness.com/ja-jp/q/748f2f)
