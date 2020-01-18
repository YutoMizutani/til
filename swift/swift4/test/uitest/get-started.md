## UITest GetStarted

```swift
import XCTest

class SnapshotTests: XCTestCase {
    private var application: XCUIApplication!
    private var navigationTitle: String = ""

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        application = XCUIApplication()
        application.launchEnvironment = ProcessInfo.processInfo.environment

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        setupSnapshot(application, waitForAnimations: false)
        application.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testGreenSnapshot() {
        snapshotLaunchScreen()
        snapshotCell()
        snapshotField()
    }

    private func snapshotLaunchScreen() {
        snapshot("LaunchScreen")
    }

    private func snapshotCell() {
        navigationTitle = "Table"
        XCTAssert(application.navigationBars.staticTexts[navigationTitle].exists)
        snapshot("Show - \(navigationTitle)")

        let cell = application.cells.element(boundBy: 0)
        cell.tap()
        snapshot("\(navigationTitle) - Tap cell")
    }

    private func snapshotField() {
        navigationTitle = "Field"
        XCTAssert(application.navigationBars.staticTexts[navigationTitle].exists)
        snapshot("Show - \(navigationTitle)")

        let textField = application.textFields["textField"]
        textField.tap()
        textField.typeText("\(1_000)")
        snapshot("\(navigationTitle) - Input textField")

        let button = application.buttons["button"]
        button.tap()
    }
}
```

[【Swift】初めてのUITest導入](https://qiita.com/taji-taji/items/c00e5b94376c37f17443)
[XCUITestを試す #2 (TableView編)](https://qiita.com/rnishimu22001/items/6781c316948c252377be)
