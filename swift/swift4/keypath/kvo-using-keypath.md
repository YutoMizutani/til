## KVO using KeyPath in Swift 5

```swift
import Foundation

class StringObserver: NSObject {
    @objc dynamic var value: String
    private var observers: [NSKeyValueObservation] = []

    init(_ value: String) {
        self.value = value
        super.init()
        observers.append(observe(\.value, options: NSKeyValueObservingOptions.new) { _, change in
            print("Update: \(change.oldValue ?? "") -> \(change.newValue ?? "")")
        })
    }
}

let stringObserver = StringObserver("foo")
stringObserver.value = "bar"

sleep(2)
```

[Swift 4 (BETA 2) KVO crashing, based upon WWDC talk](https://stackoverflow.com/questions/44706588/swift-4-beta-2-kvo-crashing-based-upon-wwdc-talk)
[Swift4のKVOに感動した。](https://qiita.com/ObuchiYuki/items/d00ce5f44725672184da#nsobjectobservekeypathoptionschangehandler)
