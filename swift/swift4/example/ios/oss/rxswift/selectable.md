## Selectable

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    var focusView: BehaviorRelay<UIView?> = BehaviorRelay(value: nil)
/* ... */
```

```swift
import UIKit
import RxSwift
import RxCocoa

protocol Selectable {
    var focusBorderView: UIView { get set }
    var deleteButton: UIView { get set }
    var isFocus: BehaviorRelay<Bool> { get set }
}

extension Selectable where Self: UIView {
    func selectableBinding(_ disposeBag: DisposeBag) {
        var appDelegate: AppDelegate = UIApplication.shared.delegate as AppDelegate

        self.rx.tap
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                appDelegate.accept(self)
            })
            .disposed(by: disposeBag)

        appDelegate.focusView
            .map{ $0 == self }
            .bind(self.isFocus)
            .disposed(by: disposeBag)

        let sharedFocus = self.isFocus.map{ !$0 }.asDriver(onErrorJustReturn: false).shared(1)

        sharedFocus
            .drive(self.focusBorderView.rx.isHidden)
            .disposed(by: disposeBag)

        sharedFocus
            .drive(self.deleteButton.rx.isHidden)
            .disposed(by: disposeBag)
    }
}
```
