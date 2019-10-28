## Gradient

```swift
Text("Hello World")
    .padding()
    .foregroundColor(.white)
    .background(LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom))
```

```swift
let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red])
let conic = AngularGradient(gradient: colors, center: .center, startAngle: .zero, endAngle: .degrees(360))
return Circle()
    .strokeBorder(conic, lineWidth: 50)
```

[How to render a gradient](https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-a-gradient)
