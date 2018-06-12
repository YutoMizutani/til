## Get most front ViewController

```swift
extension UIViewController {
    var front: UIViewController? {
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            var frontViewControlelr: UIViewController = rootViewController

            while let presentedViewController = frontViewControlelr.presentedViewController {
                frontViewControlelr = presentedViewController
            }

            return frontViewControlelr
        } else {
            return nil
        }
    }
}
```

[現在表示されているViewControllerを取得する方法](https://qiita.com/maebaru/items/ae954b19ad334f990538)
