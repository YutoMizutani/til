## Get duration from AVPlayer

### CurrentDuration

```swift
let player: AVPlayer
CMTimeGetSeconds(player.currentTime())
```

### MaximumDuration

```swift
let player: AVPlayer
CMTimeGetSeconds(player.currentItem!.duration)
```

[AVFoundationとRxを組み合わせる](https://qiita.com/to4iki/items/44b87aba9eea5d7cbe9e)
[AVPlayerを秒指定でシークする](https://qiita.com/noppefoxwolf/items/2b9339fda671102aa91d)
