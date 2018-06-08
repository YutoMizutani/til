import Foundation

var array: [String] = []
var result: [String] = []

// while let str = readLine() {
//     // until "-1" input
//     if str == "-1" { break }
//     array.append(str)
// }

array = (0...10000).map{ String(format: "%05d", $0) }

let startDate = Date()

for content in array {
    var kimari: String = ""
    let withoutArray = array.filter{ $0 != content }

    var i = 0
    while i < content.count {
        kimari = String(content[..<content.index(content.startIndex, offsetBy: i+1)])

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
		// print(kimari)
}

let endDate = Date()
let time = endDate.timeIntervalSince(startDate)
var hh = Int(time / 3600)
var mm = Int((time - Double(hh * 3600)) / 60)
var ss = Int(time - Double(hh * 3600 + mm * 60))
var date_String = String(format: "%02d:%02d:%02d", hh, mm, ss)

print(date_String)

// result.forEach{ print($0) }
