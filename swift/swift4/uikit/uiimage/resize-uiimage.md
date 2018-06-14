## Resize UIImage

Swift extension for resizing UIImage

```swift
extension UIImage {
    func resize(for _size: CGSize, opaque: Bool=false) -> UIImage? {
        let widthRatio = _size.width / self.size.width
        let heightRatio = _size.height / self.size.height
        let ratio = widthRatio < heightRatio ? widthRatio : heightRatio

        let resizedSize = CGSize(width: self.size.width * ratio, height: self.size.height * ratio)

        UIGraphicsBeginImageContextWithOptions(resizedSize, opaque, 0.0)
        draw(in: CGRect(origin: .zero, size: resizedSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return resizedImage
    }
}
```

`UIGraphicsBeginImageContext`でリサイズすると画像が粗くなる。
[UIImageのリサイズ方法と注意点](https://qiita.com/ruwatana/items/473c1fb6fc889215fca3)
> 原因はUIGraphicsBeginImageContext(resizedSize)でした。
> これを用いて実行すると、Retinaディスプレイのscaleの設定が無視され、事実上のpixelサイズで扱われてリサイズ処理がされてしまいます。
> つまり1xの画像として書き出されてしまうということでした。

[UIImageのリサイズ方法と注意点](https://qiita.com/ruwatana/items/473c1fb6fc889215fca3)
[UIGraphicsBeginImageContextWithOptions(_:_:_:)](https://developer.apple.com/documentation/uikit/1623912-uigraphicsbeginimagecontextwitho)
