## Switch compare

#1 Using switch with PartialRangeFrom and PartialRangeUpTo

```swift
let value = 1

switch value {
case 1...:
    print("greater than zero")
case 0:
    print("zero")
case ..<0:
    print("less than zero")
default:
    fatalError()
}
```

#2 Using switch with ClosedRange and Range

```swift
let value = 1

switch value {
case 1 ... Int.max:
    print("greater than zero")
case Int.min ..< 0:
    print("less than zero")
case 0:
    print("zero")
default:
    fatalError()
}
```

#3 Using switch with where clause

```swift
let value = 1

switch value {
case let val where val > 0:
    print("\(val) is greater than zero")
case let val where val == 0:
    print("\(val) is zero")
case let val where val < 0:
    print("\(val) is less than zero")
default:
    fatalError()
}
```

#4 Using switch with where clause and assignment to _

```swift
let value = 1

switch value {
case _ where value > 0:
    print("greater than zero")
case _ where value == 0:
    print("zero")
case _ where value < 0:
    print("less than zero")
default:
    fatalError()
}
```

#5 Using switch with RangeExpression protocol's ~=(_:_:) operator

```swift
let value = 1

switch true {
case 1... ~= value:
    print("greater than zero")
case ..<0 ~= value:
    print("less than zero")
default:
    print("zero")
}
```

#6 Using switch with Equatable protocol's ~=(_:_:) operator

```swift
let value = 1

switch true {
case value > 0:
    print("greater than zero")
case value < 0:
    print("less than zero")
case 0 ~= value:
    print("zero")
default:
    fatalError()
}
```

#7 Using switch with PartialRangeFrom, PartialRangeUpTo and RangeExpression's contains(_:) method

```swift
let value = 1

switch true {
case (1...).contains(value):
    print("greater than zero")
case (..<0).contains(value):
    print("less than zero")
default:
    print("zero")
}
```

[Lesser than or greater than in Swift switch statement](https://stackoverflow.com/a/44474754)
