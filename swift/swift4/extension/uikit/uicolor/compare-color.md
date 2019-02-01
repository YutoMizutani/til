## Compare UIColor

```swift
import UIKit

extension UIColor {
    private static func compare(_ l: UIColor, _ r: UIColor) -> Bool {
        var leftColor: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        guard l.getRed(&leftColor.red, green: &leftColor.green, blue: &leftColor.blue, alpha: &leftColor.alpha) else { return false }
        var rightColor: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        guard r.getRed(&rightColor.red, green: &rightColor.green, blue: &rightColor.blue, alpha: &rightColor.alpha) else { return false }
        return leftColor.red == rightColor.red
            && leftColor.green == rightColor.green
            && leftColor.blue == rightColor.blue
            && leftColor.alpha == rightColor.alpha
    }

    static func == (l: UIColor, r: UIColor) -> Bool {
        return compare(l, r)
    }

    static func == (l: UIColor?, r: UIColor) -> Bool {
        guard let l = l else { return false }
        return compare(l, r)
    }

    static func == (l: UIColor, r: UIColor?) -> Bool {
        guard let r = r else { return false }
        return compare(l, r)
    }
}
```

[How to compare UIColors?](https://stackoverflow.com/questions/970475/how-to-compare-uicolors)
