## Compare Date

```swift
let now : Date = Date()
let yesterday: Date = Date(timeIntervalSinceNow: -60*60*24)
let tomorrow: Date = Date(timeIntervalSinceNow: 60*60*24)
let anotherNow : Date = Date()
let otherNow : Date = now

if tomorrow > now {
   print("tomorrowはnowよりも未来")  // 実行される
}
if tomorrow != now {
   print("tomorrowとnowは違う日")  // 実行される
}
if yesterday > now {
   print("yesterdayはnowよりも未来")  // 実行されない
}
if yesterday < now {
   print("yesterdayはnowよりも過去")  // 実行される
}
if now == anotherNow {
   print("nowとanotherNowは同じ")  // 実行されない
}
if now == otherNow {
   print("nowとotherNowは同じ")  // 実行される
}
if now <= anotherNow {
   print("nowはanotherNowよりもちょっとだけ未来")  // 実行される
}
```

[Swift3で日付（Date）の比較が超簡単になっていた件](https://qiita.com/takashings/items/06b85a427aa560041a91)
