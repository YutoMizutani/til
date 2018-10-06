## Pick up text

```swift
let text: String = "abcdefg"
let keyword: String = "cde"

let before: String = String(text[text.startIndex..<text.range(of: keyword)!.lowerBound]) // ab
let after: String = String(text[text.range(of: keyword)!.upperBound..<text.endIndex]) // fg
```

[文字列中に指定の文字列が何番目にあるか調べる方法](https://ja.stackoverflow.com/questions/22838/%E6%96%87%E5%AD%97%E5%88%97%E4%B8%AD%E3%81%AB%E6%8C%87%E5%AE%9A%E3%81%AE%E6%96%87%E5%AD%97%E5%88%97%E3%81%8C%E4%BD%95%E7%95%AA%E7%9B%AE%E3%81%AB%E3%81%82%E3%82%8B%E3%81%8B%E8%AA%BF%E3%81%B9%E3%82%8B%E6%96%B9%E6%B3%95)
[swift4の文字列操作（Substring）メモ](https://qiita.com/MTattin/items/f97d1a51efd8eac109cf)
