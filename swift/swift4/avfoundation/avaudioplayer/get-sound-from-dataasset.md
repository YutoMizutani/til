## Get sound from dataasset

```swift
import AVFoundation

let data = NSDataAsset(name: "sound")!.data
let player = try? AVAudioPlayer(data: data, fileTypeHint: "wav")
```

[Swiftでmp3の音を再生する(AVFoundation)](http://www.cl9.info/entry/2017/08/02/220000)
> 注意点ですが、下のようにplayerをローカル変数として定義すると音が再生されません。
> 再生前に変数が開放されるためだと思われます。

[[iOS] サウンドや動画素材をAsset Catalogで管理する](https://dev.classmethod.jp/smartphone/ios-audio-video-from-asset-catalog/)
[Swiftでmp3の音を再生する(AVFoundation)](http://www.cl9.info/entry/2017/08/02/220000)
