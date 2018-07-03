## Service

ServiceはViewModelから参照された後，内部でfooObserverを利用すると，外部にSignalを伝えることが可能。

```swift
import Result
import ReactiveSwift

final class Service {
    let (fooSignal, fooObserver) = Signal<String, NoError>.pipe()

  	func foo(_ text: String) -> SignalProducer<Bool, NoError> {
    		return SignalProducer { [weak self] observer, disposable in
      			self?.fooObserver.send(value: text)
      			observer.send(value: true)
      			observer.sendCompleted()
    		}
  	}
}


let service = Service()
service.fooSignal.observeValues {
	 print("\($0)")
}
```
