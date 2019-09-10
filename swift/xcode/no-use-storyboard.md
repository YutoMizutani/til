## No use Storyboared

Edit `AppDelegate.swift`

```swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        return true
    }
}
```

and set empty on `Main Interface` field

<img width="700" alt="screenshot" src="https://user-images.githubusercontent.com/22558921/64345094-a65fa280-d02a-11e9-9314-64594aff8e8c.png">
