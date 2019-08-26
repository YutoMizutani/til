## DeinitDisposable

```swift
import RxSwift

class DeinitDisposable {
    final let compositeDisposable = CompositeDisposable()

    deinit {
        compositeDisposable.dispose()
    }
}

import RxCocoa
import RxSwift

extension CompositeDisposable {
    @discardableResult
    func add(_ disposable: Disposable) -> DisposeKey? {
        return insert(disposable)
    }
}

extension Disposable {
    @discardableResult
    func disposed(by disposable: CompositeDisposable) -> CompositeDisposable.DisposeKey? {
        return disposable.insert(self)
    }
}

extension ObservableType {
    @discardableResult
    func subscribeAndDisposed(by disposable: CompositeDisposable) -> CompositeDisposable.DisposeKey? {
        return disposable.insert(self.subscribe())
    }
}
```
