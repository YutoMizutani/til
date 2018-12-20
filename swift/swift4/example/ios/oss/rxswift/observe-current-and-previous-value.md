## Observable Current and Previous Value

```swift
extension ObservableType {
    /// Observable Current and Previous Value
    func withPrevious(startWith e: E? = nil) -> Observable<(previous: E, current: E)> {
        return scan((e, e)) { ($0.1, $1) }
            .filter({ $0.0 != nil && $0.1 != nil }).map { ($0.0!, $0.1!) }
    }
}
```

[Observable Current and Previous Value - Stack Overflow](https://stackoverflow.com/questions/36050347/observable-current-and-previous-value)
