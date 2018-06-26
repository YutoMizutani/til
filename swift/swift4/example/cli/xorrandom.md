## XorRandom

//https://github.com/SKCraft/Plume/blob/1c9ca68e80db808cc35730cff16702b20faae826/src/main/java/com/skcraft/plume/common/util/XorRandom.java
//https://stackoverflow.com/questions/41202147/unsigned-right-shift-operator-in-swift

```swift
// unsigned right shift operator
infix operator >>> : BitwiseShiftPrecedence
private func >>> (lhs: Int64, rhs: Int64) -> Int64 {
    return Int64(bitPattern: UInt64(bitPattern: lhs) >> UInt64(rhs))
}

open class XorRandom {

    private var x: Int64 = 0

    public init() {
        self.x = Int64(Date().timeIntervalSince1970)
    }

    public init(_ x: Int64) {
        self.x = x
    }

    open func next() -> Int64 {
        x ^= (x << 21)
        x ^= (x >>> 35)
        x ^= (x << 4)
        return x
    }

}
```
