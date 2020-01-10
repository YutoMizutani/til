## Inject

```swift
import Foundation

public protocol Injectable {
    associatedtype Dependency

    func inject(_ dependency: Dependency)
}

/// DI
@propertyWrapper
public struct Inject<T: Injectable> {
    private var value: T!
    public var dependency: T.Dependency

    public var wrappedValue: T {
        get { value }
        set {
            value = newValue
            value.inject(dependency)
        }
    }

    public init(_ dependency: T.Dependency) {
        self.dependency = dependency
    }
}
```
