## Range to Array

#### Range\<Int\> to \[Int\]

Rangeをmapするのがシンプル。

```swift
let min = 0, max = 100
let intArray: [Int] = (min...max).map{ $0 }
```

```swift
let min = 0, max = 100
let intArray: [Int] = Array(min...max)
```

[swift convert Range<Int> to [Int]](https://stackoverflow.com/questions/32103282/swift-convert-rangeint-to-int)
