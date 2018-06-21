## Remove all value in UserDefaults

```swift
extension UserDefaults {
    /// UserDefaultsの初期化
    func reset() {
        let dictionary = self.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            self.removeObject(forKey: key)
        }
        self.synchronize()
    }
}
```

[How to remove all UserDefaults data ? - Swift [duplicate]](https://stackoverflow.com/questions/43402032/how-to-remove-all-userdefaults-data-swift)
[UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults?changes=_9)
