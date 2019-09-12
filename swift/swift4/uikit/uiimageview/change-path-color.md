## Change color of image path

```swift
extension UIImageView {
  func setImageColor(_ color: UIColor) {
    let templateImage = image?.withRenderingMode(.alwaysTemplate)
    image = templateImage
    tintColor = color
  }
}

let imageView = UIImageView(image: UIImage(named: "your_image_name"))
imageView.setImageColor(color: UIColor.purple)
```

[How can I color a UIImage in Swift?](https://stackoverflow.com/a/36591030)
