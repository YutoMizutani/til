## Get allowed camera permission

`AVCaptureDevice`の`AVCaptureDevice.authorizationStatus(for: <#AVMediaType#>)`を利用する。
カメラの場合は`AVMediaType.video`を指定する。

```swift
import AVFoundation

let mediaType: AVMediaType = .video
let status = AVCaptureDevice.authorizationStatus(for: mediaType)
```

[iOSでカメラと写真の利用許可の確認方法[AVCaptureDevice]](https://qiita.com/CodeCoder/items/37b3c12ff9426d095f89)
[【iOS】アプリに各アクセス権限が付与されているか確認する方法](https://qiita.com/ryokosuge/items/73aa5f85c529afd06aac)
