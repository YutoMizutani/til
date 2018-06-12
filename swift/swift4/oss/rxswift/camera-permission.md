## Camera permissions authorization

#### Extension

```swift
import RxSwift
import RxCocoa

extension Reactive where Base: PHPhotoLibrary {
    /// Request authorization using RxSwift
    static func requestAuthorization() -> Single<PHAuthorizationStatus> {
        return .create { observer in
            let status = Base.authorizationStatus()
            switch status {
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { status in
                    DispatchQueue.main.async {
                        observer(.success(status))
                    }
                }
            default:
                observer(.success(status))
            }
            return Disposables.create()
        }
    }
}

extension Reactive where Base: AVCaptureDevice {
    /// Request authorization using RxSwift
    static func requestAuthorization(for mediaType: AVMediaType) -> Single<AVAuthorizationStatus> {
        return .create { observer in
            let status = Base.authorizationStatus(for: mediaType)
            switch status {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: mediaType) { authorized in
                    DispatchQueue.main.async {
                        observer(.success(authorized ? .authorized : .denied))
                    }
                }
            default:
                observer(.success(status))
            }
            return Disposables.create()
        }
    }
}
```

#### Usage

```swift
albumButton.rx.tap
    .flatMap { PHPhotoLibrary.rx.requestAuthorization() }
    .map { $0 == .authorized }
    .bind { authorized in
        if authorized {
            // pickerを表示
        } else {
            // アクセス許可してねというアラートなりを表示
        }
    }
    .disposed(by: disposeBag)
```

[カメラと写真の許可状態の取得をRxSwiftと絡める](https://qiita.com/sgr-ksmt/items/4ded7e9bbe4c7b5f4796)
