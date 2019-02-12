## Unwrap

```swift
import RxSwift

extension ObservableType {
    func unwrap<T>() -> Observable<T> where E == T? {
        return filter { $0 != nil }.map { $0! }
    }
}
```
