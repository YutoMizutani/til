## Launch applications

`XCTest`をインポートして，

`XCUIApplication`のインスタンスを生成して，

`.launch()`で起動する。

#### Sample

Xcodeでプロジェクトを生成する際に，`include UITests`オプションを有効にすることで自動で生成される。

```swift
import XCTest

class sampleUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        self.app = XCUIApplication()
        self.app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
}
```

[【Swift】初めてのUITest導入](https://qiita.com/taji-taji/items/c00e5b94376c37f17443)
