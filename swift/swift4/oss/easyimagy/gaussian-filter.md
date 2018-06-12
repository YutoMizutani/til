## Gaussian filter

```swift
let weights = [
    1,  4,  6,  4, 1,
    4, 16, 24, 16, 4,
    6, 24, 36, 24, 6,
    4, 16, 24, 16, 4,
    1,  4,  6,  4, 1,
]
let result = image.map { x, y, pixel in
    image[(y - 2)...(y + 2), (x - 2)...(x + 2)].map {
        Pixel.weightedMean(zip(weights, $0))
    } ?? pixel
}
```

[koher/EasyImagy](https://github.com/koher/EasyImagy)
[Swiftで画像をめちゃくちゃ簡単にあつかえるライブラリ](https://qiita.com/koher/items/7dc1aa10755b79102539)
