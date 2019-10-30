## TabView

```swift
struct ContentView : View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection){
            Text("First View")
                .font(.title)
                .tabItem { Text("First") }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem { Text("Second") }
                .tag(1)
        }
    }
}
```

[SwiftUIのTabbedViewで遊んでみる](https://qiita.com/kaoryuuu/items/8749f5b7e0320ddb76c3)
