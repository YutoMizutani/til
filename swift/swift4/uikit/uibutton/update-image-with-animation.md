## Update image with animation in UIButton

```swift
private func updateImage(_ image: UIImage?, duration: TimeInterval) {
    guard let image = image else { return }
    let point = CGPoint(x: center.x - image.size.width / 2, y: center.y - image.size.height / 2)
    UIView.transition(with: self,
                      duration: duration,
                      options: .transitionCrossDissolve,
                      animations: {
                        self.setImage(image, for: .normal)
                        self.frame = CGRect(x: point.x, y: point.y, width: image.size.width, height: image.size.height)
                      },
                      completion: nil)
}
```

[UIImageView の画像をフェードインアウトさせて変更する](http://koze.hatenablog.jp/entry/2016/07/29/093000)
[Animating UIButton images](https://stackoverflow.com/questions/1529720/animating-uibutton-images)
