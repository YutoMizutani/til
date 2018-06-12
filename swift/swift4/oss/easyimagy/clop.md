## Crop

> Slicing is executed with no copying costs.
画像のスライス(切り出し)はコピーコストなしに実行される。
生成時までコストがかからない。
また、はみ出した場合にはnilが返される。

```swift
let slice: ImageSlice<RGBA<UInt8>> = image[32..<64, 32..<64] // No copying costs
let cropped = Image<RGBA<UInt8>>(slice) // Copying is executed here
```

[koher/EasyImagy](https://github.com/koher/EasyImagy)
[Swiftで画像をめちゃくちゃ簡単にあつかえるライブラリ](https://qiita.com/koher/items/7dc1aa10755b79102539)
