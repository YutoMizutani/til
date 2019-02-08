## Crop image

```swift
import UIKit

extension UIImage.Orientation {
    /// 画像が横向きであるか
    var isLandscape: Bool {
        switch self {
        case .up, .down, .upMirrored, .downMirrored:
            return false
        case .left, .right, .leftMirrored, .rightMirrored:
            return true
        }
    }
}

extension CGRect {
    /// 反転させたサイズを返す
    var switched: CGRect {
        return CGRect(x: minY, y: minX, width: height, height: width)
    }
}

extension UIImage {
    func cropping(to rect: CGRect) -> UIImage? {
        let croppingRect: CGRect = imageOrientation.isLandscape ? rect.switched : rect
        guard let cgImage: CGImage = self.cgImage?.cropping(to: croppingRect) else { return nil }
        let cropped: UIImage = UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        return cropped
    }
}
```
