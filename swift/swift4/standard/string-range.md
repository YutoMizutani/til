## String range

Stringの範囲抽出はindex指定で戻り値がSubstringで不便極まりない。
Extensionで複雑なことは陰蔽しよう。

```swift
extension String: CollectironType {
    func until(_ index: Int) -> String? {
        return String(self[..<self.index(self.startIndex, offsetBy: i)])
    }

    func start(at i: Int) -> String? {
        return String(self[self.index(self.startIndex, offsetBy: i, limitedBy: self.endIndex)...])
    }

    func range(start x: Int, end y: Int) -> String? {
        return String(self[self.index(self.startIndex, offsetBy: x, limitedBy: self.endIndex)...self.index(self.startIndex, offsetBy: y, limitedBy: self.endIndex)])
    }
}
```

```swift
import XCTest

class StringTests: XCTestCase {
    let text = "Hello, world!!"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testUntil() {
        XCTAssertEqual(self.text.until(Int.min), nil)
        XCTAssertEqual(self.text.until(-1), nil)
        XCTAssertEqual(self.text.until(0), "")
        XCTAssertEqual(self.text.until(5), "Hello")
        XCTAssertEqual(self.text.until(self.text.count), "Hello, world!!")
        XCTAssertEqual(self.text.until(self.text.count+1), nil)
        XCTAssertEqual(self.text.until(Int.max), nil)
    }

    func testStart() {
        XCTAssertEqual(self.text.until(Int.min), nil)
        XCTAssertEqual(self.text.start(at: -1), nil)
        XCTAssertEqual(self.text.start(at: 0), "Hello, world!!")
        XCTAssertEqual(self.text.start(at: 7), "world!!")
        XCTAssertEqual(self.text.start(at: self.text.count), "")
        XCTAssertEqual(self.text.start(at: self.text.count+1), nil)
        XCTAssertEqual(self.text.start(at: Int.max), nil)
    }

    func testRange() {
        XCTAssertEqual(self.text.start(start: 0, end: self.text.count), "Hello, world!!")
    }
}
```

[Swiftで競技プログラミング](https://qiita.com/touyoubuntu/items/1d8a9c00a283e98bc8e4)

[Swift 4 で substring 的にインデックスを指定して部分文字列を取り出す方法](http://gootara.org/library/2017/09/swift4substr.html)
