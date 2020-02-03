## Save Custom class using UserDefaults

```swift
import Foundation

let key = "UserDefaultsKey"

class CustomClass: NSObject, NSCoding {
    var text: String

    init(text: String) {
        self.text = text
    }

    required init?(coder: NSCoder) {
        text = (coder.decodeObject(forKey: "text") as? String) ?? ""
    }

    func encode(with coder: NSCoder) {
        coder.encode(text, forKey: "text")
    }

    func get() -> CustomClass? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? CustomClass
    }

    func set() {
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
```

[Swift：独自クラスをUserDefaultsで保存する](https://qiita.com/Kyome/items/46403b1422d13f29078a)
