```swift
extension Driver where E == Event {
    func mapToElement() -> Driver<Event.ElementType> {
        return map { $0.element }.filter({ $0 != nil }).map { $0! }
    }

    func mapToError() -> Driver<Error> {
        return map { $0.error }.filter({ $0 != nil }).map { $0! }
    }
}
```
