## Equatable

Equatableプロパティに準拠させることで，それぞれを比較するプロパティを追加することができる。

```swift
class StreetAddress {
    let number: String
    let street: String
    let unit: String?

    init(_ number: String, _ street: String, unit: String? = nil) {
        self.number = number
        self.street = street
        self.unit = unit
    }
}
```

```swift
extension StreetAddress: Equatable {
    static func == (lhs: StreetAddress, rhs: StreetAddress) -> Bool {
        return
            lhs.number == rhs.number &&
            lhs.street == rhs.street &&
            lhs.unit == rhs.unit
    }
}
```

#### `contains(_:)`

Equatableプロトコルに準拠させることで，Equatableにextensionされている拡張メソッドにアクセスすることができる。
`.contains(_:)`メソッドにより，追加した演算子の他，部分一致の判定が可能となる。

```swift
let addresses = [StreetAddress("1490", "Grove Street"),
                 StreetAddress("2119", "Maple Avenue"),
                 StreetAddress("1400", "16th Street")]
let home = StreetAddress("1400", "16th Street")

print(addresses[0] == home)
// Prints "false"
print(addresses.contains(home))
// Prints "true"
```

#### `===`

同一オブジェクトの判定も可能。

```swift
class IntegerRef: Equatable {
    let value: Int
    init(_ value: Int) {
        self.value = value
    }

    static func == (lhs: IntegerRef, rhs: IntegerRef) -> Bool {
        return lhs.value == rhs.value
    }
}
```

```swift
let a = IntegerRef(100)
let b = IntegerRef(100)

print(a == a, a == b, separator: ", ")
// Prints "true, true"

let c = a
print(c === a, c === b, separator: ", ")
// Prints "true, false"
```

#### Reference

[Equatable](https://developer.apple.com/documentation/swift/equatable)
[Equatableとは？(swift) ~ object同士を比較できるようにしよう〜](https://qiita.com/Saayaman/items/e0ca9d22daef50e549dc)
