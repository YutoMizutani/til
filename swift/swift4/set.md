## Set(集合)

重複のない集合

```swift
let a: Set<Int> = [1, 1, 1, 2, 3]
print(a) // [1, 2, 3]
```

論理演算

```swift
let b: Set = [1, 2, 3]
let c: Set = [2, 3, 4]

print(b.union(c))
print(b.intersection(c))
print(b.subtracting(c))
```
