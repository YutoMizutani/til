## Debug print in Combine

Like `.do(onNext: ...)` function in RxSwift


> [Debugging using the handleEvents operator](https://www.avanderlee.com/debugging/combine-swift/)
```swift
let subject = PassthroughSubject<String, Never>()
let subscription = subject.handleEvents(receiveSubscription: { (subscription) in
    print("Receive subscription")
}, receiveOutput: { output in
    print("Received output: \(output)")
}, receiveCompletion: { _ in
    print("Receive completion")
}, receiveCancel: {
    print("Receive cancel")
}, receiveRequest: { demand in
    print("Receive request: \(demand)")
}).sink { _ in }

subject.send("Hello!")
subscription.cancel()

// Prints out:
// Receive request: unlimited
// Receive subscription
// Received output: Hello!
// Receive cancel
```

[Combine debugging using operators in Swift](https://www.avanderlee.com/debugging/combine-swift/)
