## Repeat play using AVPlayer

```swift
NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
     player?.seek(to: CMTime.zero)
     player?.play()
}
```

[Looping a video with AVFoundation AVPlayer?](https://stackoverflow.com/questions/5361145/looping-a-video-with-avfoundation-avplayer)
