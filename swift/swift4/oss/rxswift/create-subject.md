## Create Subject

任意のタイミングでEventを発行するStream

```swift
private let subject: BehaviorSubject<Void> = BehaviorSubject(value: ())
_ = subject.do()
```

[How to manually send next signal to a observable in RxSwift?](https://stackoverflow.com/questions/39450565/how-to-manually-send-next-signal-to-a-observable-in-rxswift)
