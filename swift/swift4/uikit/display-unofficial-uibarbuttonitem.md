## Display unofficial UIBarButtonItem

[<Swift> 隠れUIBarButtonItemを出現させる](https://qiita.com/mshrwtnb/items/327e8342c4d7aefe4853)
> 非公開APIを呼び出すことで、UIToolbarの下記Itemが使えるようになります（通常は利用不可）。

```swift
extension UIBarButtonItem {
    enum HiddenItem: Int {
        case Arrow = 100
        case Back = 101
        case Forward = 102
        case Up = 103
        case Down = 104
    }

    convenience init(barButtonHiddenItem: HiddenItem, target: AnyObject?, action: Selector?) {
        let systemItem = UIBarButtonSystemItem(rawValue: barButtonHiddenItem.rawValue)
        self.init(barButtonSystemItem: systemItem!, target: target, action: action)
    }
}
```

#### Usage

```swift
let items =
[
    UIBarButtonItem(barButtonHiddenItem: .Arrow, target: nil, action: nil),
    UIBarButtonItem(barButtonHiddenItem: .Back, target: nil, action: nil),
    UIBarButtonItem(barButtonHiddenItem: .Forward, target: nil, action: nil),
    UIBarButtonItem(barButtonHiddenItem: .Up, target: nil, action: nil),
    UIBarButtonItem(barButtonHiddenItem: .Down, target: nil, action: nil)
]

self.navigationController?.setToolbarHidden(false, animated: false)
self.setToolbarItems(items, animated: false)
```

[<Swift> 隠れUIBarButtonItemを出現させる](https://qiita.com/mshrwtnb/items/327e8342c4d7aefe4853)
