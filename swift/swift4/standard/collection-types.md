## Collection Types

| キーワード | 説明 |
|-|-|
| Array | 順序付きの値の集合 |
| Set | 一意の値の集合(順不同) |
| Dictionary | キーと値で関連づけられた集合(順不同) |

#### Array

順序付きの値の集合を示す。

```swift
var soneInts = [Int]() // []
someInts.append(3) // [3]
someInts = [] // []
```

`Array(repeating: , count: )`にて宣言することで、同値の配列を複数初期化宣言することができる。

```swift
var threeDoubles = Array(repeating: 0.0, count: 3) // [0.0, 0.0, 0.0]
```

[Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
