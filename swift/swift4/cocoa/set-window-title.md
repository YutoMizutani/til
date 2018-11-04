## Set window title in Cocoa

![](https://i.stack.imgur.com/j3cut.png)

```swift
@IBOutlet weak var window: NSWindow!

override func windowDidLoad() {
    super.windowDidLoad()

    window.title = "New Title"
}
```

[Cocoa: How to set window title?](https://stackoverflow.com/questions/9407177/cocoa-how-to-set-window-title)
