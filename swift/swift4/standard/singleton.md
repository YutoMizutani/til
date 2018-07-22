## Singleton

```swift
class Manager {
    static let sharedManager = Manager()
    private init() {
    }
}
```

```swift
class Manager {
    static var sharedManager: Manager = {
        return Manager()
    }()
    private init() {
    }
}
```

[Swift で簡単なシングルトンの実装方法](https://qiita.com/codelynx/items/a936afe0a45d4cf5abfb)
