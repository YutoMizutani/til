## Date formatting in Swift

```swift
let dateFormater = DateFormatter()
dateFormater.locale = Locale(identifier: "ja_JP")
dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
let date = dateFormater.string(from: Date())
print(date)     // 2017/04/04 10:44:31
```

[日付関連クラスのまとめ(Swift3)](https://qiita.com/eKushida/items/541a65800efe1ffc523f)
