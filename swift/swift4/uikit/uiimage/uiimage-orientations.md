## CGImageは画像の向きを保持していない

画像編集アプリ([iOSCameraSample – GitHub](https://github.com/YutoMizutani/iOSCameraSample)) を作成している際にハマったため，備忘録として記事にします。
記事が古くならないよう，参照を添えてAgeておきます。*知らないと必ずハマります。ハマりました。*

## 発生した問題

コントラストを変更しようと編集した`UIImage`を`UIImageView`に反映させた際に，何故か画像が横に回転してしまった。

## 原因

`CGImage`が向きのパラメータを保持していないことが原因であった。

画像のコントラストを変更するために必要な，
`UIImage` -> `CGImage` -> `CIImage` -> `CGImage` -> `UIImage`
へとキャストしていく過程で，

`UIImage`から`CGImage`への変換時に方向パラメータを喪失した。

```swift
let uiImage = UIImage()
let cgImage = uiImage.cgImage
```

`CGImage`から`UIImage`への変換時に
`UIImage.imageOrientation`がnilとなり，表示先の`UIImageView`が方向を読み取れなくなったことが原因。

```swift
var uiImage = UIImage()
let cgImage = uiImage.cgImage
uiImage = UIImage(cgImage: cgImage, scale: 0, orientation: nil)
```

## 対策

`UIImage`の向きのパラメータを保持し，`UIImage`にキャストする際に向きのパラメータ(`UIImageOrientation`)を注入する。

```swift
func translate(from image: UIImage) -> UIImage? {
    guard let cgImage = image.cgImage else { return nil }
    let ciImage = CIImage(cgImage: cgImage)
    let ciContext = CIContext(options: nil)

    /* CIImageを使用した画像編集処理 */

    guard let cgImage: CGImage = ciContext.createCGImage(image, from: image.extent) else { return nil }
    let result = UIImage(cgImage: cgImage, scale: 0, orientation: image.imageOrientation)
    return result
}
```

## 参考

[画像に何か加工を行った際に向きが勝手に変わってしまう](http://gokujo.hatenablog.jp/entry/2013/02/28/223939)
[iPhoneカメラで撮影した画像のUIImageからCGImageを取り出すと90度傾く問題の解決法](http://blog.katty.in/105)
[Swift で UIImage の方向を強制的に変換する](https://qiita.com/kitsuyui/items/c8d76acfa0ecd6570fdb)
