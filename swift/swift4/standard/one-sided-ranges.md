## One-Sided Ranges

| キーワード | 機能 |
|--|--|
| `...` | lhs以上rhs以下 |
| `..<` | lhs以上rhs未満 |

#### Array

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
```

省略した場合は端が補完される。

```swift
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

for name in names[..<2] {
    print(name)
}
// Anna
// Alex
```

#### Other contexts

> One-sided ranges can be used in other contexts, not just in subscripts. You can’t iterate over a one-sided range that omits a first value, because it isn’t clear where iteration should begin. You can iterate over a one-sided range that omits its final value; however, because the range continues indefinitely, make sure you add an explicit end condition for the loop. You can also check whether a one-sided range contains a particular value, as shown in the code below.

範囲を宣言することができる。

```swift
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
```

[BasicOperators](https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html)
