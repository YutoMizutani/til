## Binarization

#### 白黒二値化

```swift
let result = image.map { $0.gray < 128 ? Pixel.black : Pixel.white }
```

#### 二値化（自動閾値）

```swift
let threshold = UInt8(image.reduce(0) { $0 + $1.grayInt } / image.count)
let result = image.map { $0.gray < threshold ? Pixel.black : Pixel.white }
```

[Swiftで画像をめちゃくちゃ簡単にあつかえるライブラリ](https://qiita.com/koher/items/7dc1aa10755b79102539)
