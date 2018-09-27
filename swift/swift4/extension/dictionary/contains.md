## Contains func extension in Dictionary

```swift
extension Dictionary where Value == Equatable {
    func contains<T : Equatable>(_ element: T) -> Bool {
        let values = self.map{ $0.value as? T }.filter{ $0 != nil }.map{ $0! }
        for value in values {
            if value == element { return true }
        }
        return false
    }
}
```
