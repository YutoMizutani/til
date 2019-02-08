## Alpha image in UIImage

```swift
extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
```

```swift
let img = UIImage(named: "imageWithoutAlpha")!.alpha(0.5)
let myButton = UIButton()
myButton.setBackgroundImage(img, for: .normal)
```

```swift
let image = UIImage(named: "imageWithoutAlpha")
let imageView = UIImageView(image: image)
imageView.alpha = 0.5

myButton.setBackgroundImage(image, forState: UIControlState.Normal)
```

[How to set the alpha of an UIImage in SWIFT programmatically?](https://stackoverflow.com/questions/28517866/how-to-set-the-alpha-of-an-uiimage-in-swift-programmatically)
