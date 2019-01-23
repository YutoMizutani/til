## HashValue in Swift 4.2

```swift
enum Hash {
    case has([Int])
}

extension Hash: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .has(let v):
            hasher.combine(v)
        }
    }
}

print(Hash.has([0, 1]).hashValue)
print(Hash.has([0]).hashValue)
print(Hash.has([0]).hashValue)
print(Hash.has([0, 1, 3, 5]).hashValue)
print(Hash.has([0, 1, 3, 5]).hashValue)
```

-8862909860949091563
-4423762187690816404
-4423762187690816404
-4129726711988274176
-4129726711988274176
