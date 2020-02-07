## Run XCUITest with Dark Mode

```swift
// AppDelegate.swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        #if DEBUG
        // For fastlane dark mode UI testing
        if #available(iOS 13.0, *), ProcessInfo.processInfo.arguments.contains("DARK_MODE") {
            window?.overrideUserInterfaceStyle = .dark
        }
        #endif

        return true
    }
}
```

```swift
// Tests.swift
import XCTest

private enum DeviceMode: String {
    case light = "Light Mode"
    case dark = "Dark Mode"

    static let darkModeKey = "DARK_MODE"
}

class Tests: XCTestCase {
    func testDarkMode() {
        let application = XCUIApplication()
        application.launchArguments.append(DeviceMode.darkModeKey)
        application.launch()
    }
}
```

[XCUITestをDark Modeで実行する方法](https://qiita.com/pelican/items/b782a4a525cb7c58c757)
