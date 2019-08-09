## ComparisonFromZero

```swift
import Foundation

enum ComparisonFromZero {
    case graterThanZero
    case equalToZero
    case lessThanZero
}

extension AdditiveArithmetic where Self: Comparable {
    var comparisonFromZero: ComparisonFromZero {
        switch self {
        case _ where self > .zero:
            return .graterThanZero
        case .zero:
            return .equalToZero
        default:
            return .lessThanZero
        }
    }
}
```

[Lesser than or greater than in Swift switch statement](https://stackoverflow.com/a/31656822)
[Equatable and Comparable Written by Mattt December 19th, 2018 (revised)](https://nshipster.com/equatable-and-comparable/)
[Swift 5 の AdditiveArithmetic protocol とは何か](https://qiita.com/usamik26/items/88bba2bfcaed086fd15e)
