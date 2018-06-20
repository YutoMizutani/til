## UISlider to UILabel on RxSwift

```swift
import RxSwift
import RxCocoa

var slider: UISlider!
var label: UILabel!

let disposeBag = DisposeBag()

func binding() {
    let range: (min: Int, max: Int) = (10, 100)
    slider.rx.value
        .map { (range.max - range.min) * Int($0 * 100) / 100 + range.min }
        .map { String($0) }
        .asDriver(onErrorJustReturn: "0")
        .drive(self.label.rx.text)
        .disposed(by: disposeBag)
}
```

[SwiftでReactive Programming](https://qiita.com/shoheiyokoyama/items/60aa617ab39778d73110)
