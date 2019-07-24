## GaussianBlur in UIImage

```swift
import UIKit

extension UIImage {
    func blurred(_ amount: CGFloat = 2) -> UIImage? {
        guard let ciImage = CIImage(image: self) else { return nil }

        let affineClampFilter = CIFilter(name: "CIAffineClamp")
        affineClampFilter?.setDefaults()
        affineClampFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        let resultClamp = affineClampFilter?.value(forKey: kCIOutputImageKey)

        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(resultClamp, forKey: kCIInputImageKey)
        blurFilter?.setValue(amount, forKey: kCIInputRadiusKey)

        let ciContext = CIContext(options: nil)

        guard
            let result = blurFilter?.value(forKey: kCIOutputImageKey) as? CIImage,
            let cgImage = ciContext.createCGImage(result, from: ciImage.extent)
        else { return nil }

        return UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
    }
}
```

[How to blur an image using CIFilter with Swift 4 — Programming with Swift](https://medium.com/programming-with-swift/how-to-blur-an-image-using-cifilter-with-swift-4-programming-with-swift-37b18fc35179)
[フルスクリーンでガウスぼかし](https://stackoverrun.com/ja/q/9638302)
