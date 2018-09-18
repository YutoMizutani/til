## Compare optionals

```swift
func ==<C: Collection>(lhs: C?, rhs: C?) -> Bool where C.Iterator.Element: Equatable {
    switch (lhs, rhs) {
    case let (.some(lhs), .some(rhs)):
        return lhs == rhs
    case (.none, .none):
        return true
    default:
        return false
    }
}
```

[Comparing optional arrays](https://stackoverflow.com/questions/29478665/comparing-optional-arrays)
[SwiftLintのRules一覧（2018年3月最新版）](https://qiita.com/yuukiw00w/items/075253a868805227bc78#pattern_matching_keywords)
