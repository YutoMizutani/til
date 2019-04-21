## Recapture photos

[AVCapturePhotoSettings](https://developer.apple.com/documentation/avfoundation/avcapturephotosettings)
> Important
> It is illegal to reuse a AVCapturePhotoSettings instance for multiple captures. Calling the capturePhoto(with:delegate:) method throws an exception (invalidArgumentException) if the settings object’s uniqueID value matches that of any previously used settings object.
> To reuse a specific combination of settings, use the init(from:) initializer to create a new, unique AVCapturePhotoSettings instance from an existing photo settings object.

```swift
/*
 AVCapturePhotoSettings - https://developer.apple.com/documentation/avfoundation/avcapturephotosettings

 - Important:
 It is illegal to reuse a AVCapturePhotoSettings instance for multiple captures. Calling the capturePhoto(with:delegate:) method throws an exception (invalidArgumentException) if the settings object’s uniqueID value matches that of any previously used settings object.
 To reuse a specific combination of settings, use the init(from:) initializer to create a new, unique AVCapturePhotoSettings instance from an existing photo settings object.
 */
let capturePhotoSettings = AVCapturePhotoSettings(from: capturePhotoSettings)
```

[AVCapturePhotoSettings](https://developer.apple.com/documentation/avfoundation/avcapturephotosettings)
[AVCapturePhotoSettings #55 - remirobert/CameraEngine](https://github.com/remirobert/CameraEngine/issues/55)
