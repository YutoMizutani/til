## comma delimiter for money

名称に迷う。

```swift
func stringWithDelimiterForMoney(_ value: Int) -> String? {
    let number = NSNumber(value: value)
    let formatter = NumberFormatter()
    formatter.numberStyle = NumberFormatter.Style.decimal
    // ↓不要?
    // formatter.groupingSeparator = ","
    // formatter.groupingSize = 3
    return formatter.string(from: number)
}
```

[swiftで数字にコンマをつける](https://qiita.com/kichikuchi/items/61d1d9de0c1b06d7dd87)
[[Swift]数字を三桁ごとにカンマ区切りにする](https://qiita.com/ktanaka117/items/57c43c897fb7040e0980)
[https://qiita.com/yoshi389111/items/851d8f0348eb84cb9847](本当は間違っている「3桁カンマ編集」)
[SQL Server comma delimiter for money datatype](https://stackoverflow.com/questions/12316400/sql-server-comma-delimiter-for-money-datatype)
