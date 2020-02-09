## Random String in Swift

```swift
import Foundation

extension String {
    static func random(in range: ClosedRange<Int>) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String(range.map { _ in letters.randomElement()! })
    }
}
```

[Generate random alphanumeric string in Swift - Stack Overflow](https://stackoverflow.com/a/26845710)
