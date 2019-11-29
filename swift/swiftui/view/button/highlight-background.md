## Background highlight on SwiftUI Buttons

## Not working

```swift
Button(action: doSomething) {
    Text("Default padding")
}
.padding()
.background(Color.yellow)
```

## Work well

```swift
Button(action: doSomething) {
    Text("Default padding")
        .padding()
        .background(Color.yellow)
}
```

```swift
Button(action: doSomething) {
    HStack {
        Image(systemName: "rectangle.grid.1x2.fill")
        Text("Button with image")
    }
    .padding()
    .background(Color.yellow)
}
```

[Playing with SwiftUI Buttons](https://alejandromp.com/blog/2019/06/09/playing-with-swiftui-buttons/)
