## Use Remainder in Float in Swift

#### public func truncatingRemainder(dividingBy other: Self) -> Self

```swift
18.0.truncatingRemainder(dividingBy: 5.0)   //3.0
18.0.truncatingRemainder(dividingBy: -5.0)  //3.0
-18.0.truncatingRemainder(dividingBy: 5.0)  //-3.0
-18.0.truncatingRemainder(dividingBy: -5.0) //-3.0
```

![](https://camo.qiitausercontent.com/50d61a8ad5bfb3884a2da6e5e91fd37836a0cc5b/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f34363633312f65323865613334312d343234662d663466652d333166322d3364353531633562666334382e706e67)

#### public func remainder(dividingBy rhs: Self) -> Self

![](https://camo.qiitausercontent.com/ec0ab5f257eb13b0491699241257f3d4a261e768/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f34363633312f35303262343166612d633934352d646535372d613930372d6631653634396435373830392e706e67)

```swift
13.0.remainder(dividingBy: 5.0)     //-2.0
12.0.remainder(dividingBy: 5.0)     //2.0
-13.0.remainder(dividingBy: 5.0)    //2.0
-12.0.remainder(dividingBy: 5.0)    //-2.0
```

[SwiftのFloat系の演算で余り演算子(%)が廃止、それに変わるメソッドはだるま落としと最寄駅](https://qiita.com/samekard/items/81e095832b1cde9b71ba)
