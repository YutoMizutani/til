## Show alert

```swift
struct ContentView: View {
    @State private var isPresented = false

    var body: some View {
        Button(action: {
            self.isPresented = true
        }) {
            Text("Show Alert")
        }
        .alert(isPresented: $isPresented) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
    }
}
```

[How to show an alert](https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-an-alert)
