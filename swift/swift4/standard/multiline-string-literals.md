## Multiline String Literals

> In the example above, even though the entire multiline string literal is indented, the first and last lines in the string don’t begin with any whitespace. The middle line has more indentation than the closing quotation marks, so it starts with that extra four-space indentation.

`"""`キーワードで囲むことで、複数行の文字列の定義が可能。
その際、*最初の4つのスペースは除外される。*

```swift
let softWrappedQuotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin, \
    please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on \
    till you come to the end; then stop."
"""
```

[StringsAndCharacters](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html)
