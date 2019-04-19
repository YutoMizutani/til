## Reverse photos when front camera

#### Photo

```swift
let captureDevice: AVCaptureDevice
let isVideoMirrored = captureDevice.position == .back
let photoOutput: AVCapturePhotoOutput
let photoOutputConnection = photoOutput.connection(with: .video)

if photoOutputConnection?.isVideoMirroringSupported ?? false {
    photoOutputConnection?.isVideoMirrored = isVideoMirrored
}
```

#### Video

```swift
let captureDevice: AVCaptureDevice
let isVideoMirrored = captureDevice.position == .back
let movieFileOutput: AVCaptureMovieFileOutput
let movieFileOutputConnection = movieFileOutput.connection(with: .video)

if movieFileOutputConnection?.isVideoMirroringSupported ?? false {
    movieFileOutputConnection?.isVideoMirrored = isVideoMirrored
}
```

[IOS Swift 3: Flip Front Camera Image Horizontally after taking Camera Picture](https://stackoverflow.com/questions/40665671/ios-swift-3-flip-front-camera-image-horizontally-after-taking-camera-picture)
