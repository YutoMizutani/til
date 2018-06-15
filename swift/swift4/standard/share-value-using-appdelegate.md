## Shared value using AppDelegate

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    var message:String?
/* ... */
```

```swift
var appDelegate: AppDelegate = UIApplication.shared.delegate as AppDelegate
```

[SwiftでAppDelegateを使った画面間のデータ受け渡し](https://qiita.com/xa_un/items/814a5cd4472674640f58)
