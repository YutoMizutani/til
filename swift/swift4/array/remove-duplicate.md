## Remove duplicate items in Array

```swift
let arr = [1, 2, 3, 1, 2, 3]
Array(Set(arr)) // → [2, 3, 1]
```

#### Keep the order

```swift
let arr = [1, 2, 3, 1, 2, 3]
Array(NSOrderedSet(array: arr)) // → [2, 3, 1]
```

[Setの使いどころを書いてみる](https://qiita.com/shimesaba/items/6cf1e9498c112360b59f)
[Removing duplicate elements from an array in Swift](https://stackoverflow.com/questions/25738817/removing-duplicate-elements-from-an-array-in-swift)
[【Swift】配列内で重複する要素を除去する](https://qiita.com/ariiyu/items/55d08bfae02e586d6ff8)
