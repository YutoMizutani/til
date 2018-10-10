## Indirect

```swift
indirect enum FooType {
    case bar(FooType)
}
```

```swift
enum FooType {
    indirect case bar(FooType)
    case baz
}
```

[Swiftのindirectについて調べてみた](https://qiita.com/S_Shimotori/items/25230860d78941612d10indirect)
