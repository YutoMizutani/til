## Smoothing filter

```swift
let result = image.map { x, y, pixel in
    image[(y - 1)...(y + 1), (x - 1)...(x + 1)].map {
        Pixel.mean($0)
    } ?? pixel
}
```

[koher/EasyImagy](https://github.com/koher/EasyImagy)
[Swiftで画像をめちゃくちゃ簡単にあつかえるライブラリ](https://qiita.com/koher/items/7dc1aa10755b79102539)
