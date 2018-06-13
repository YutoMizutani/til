## Duplicate

```swift
var array: [String] = []
var result: [String] = []

while let str = readLine() {
    // until "-1" input
    if str == "-1" { break }
    array.append(str)
}

for content in array {
    var kimari: String = ""
    let withoutArray = array.filter{ $0 != content }

    var i = 0
    while i < content.count {
        kimari = String(content[..<content.index(content.startIndex, offsetBy: i)])

        var isContinue = false
        for wc in withoutArray {
            if wc.hasPrefix(kimari) {
                i += 1
                isContinue = true
                break
            }
        }
        if !isContinue { break }
    }

    result.append(kimari)
}

result.forEach{ print($0) }
```
