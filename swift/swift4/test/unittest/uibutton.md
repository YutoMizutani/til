## UIButton test

#### Get Button from test class

```swift
let button = UIButton()
button.accessibilityIdentifier = "testButton"
```

#### Usage

```swift
import XCTest

extension XCTestCase {
    func testMenuLaunchCameraButton() {
        let button = self.app.buttons["testButton"]
        XCTAssert(button.exists)
        XCTAssertTrue(button.isEnabled)
        XCTAssertEqual(button.label, "foo")
    }
}
```

## Do tap action

```swift
extension XCTestCase {
    /// PhotoEditViewに遷移する。
    func transitionView(_ app: XCUIApplication) {
        let button = app.buttons["testButton"]
        XCTAssert(button.exists)
        XCTAssertTrue(button.isEnabled)
        button.tap()
    }
}
```

```swift
import XCTest

class buttonUITests: XCTestCase {
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
        self.transitionView(self.app)
    }
}
```

[Xcode7からのUI Testing&XCUIElementの基本操作まとめ](https://qiita.com/i_terasaka/items/2cf7d0f7146f32c3f2c1)
