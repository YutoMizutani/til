## UITextField to UILabel on RxSwift

TODO: `asObservable()`がないとメモリリークする？

```swift
import RxSwift
import RxCocoa

var textField: UITextField!
var label: UILabel!

let disposeBag = DisposeBag()

func binding() {
    self.textField.rx.value
        .asObservable()
        .asDriver(onErrorJustReturn: "")
        .drive(self.label.rx.text)
        .disposed(by: disposeBag)
}
```
