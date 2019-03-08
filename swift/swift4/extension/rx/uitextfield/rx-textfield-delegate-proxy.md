## RxTextFieldDelegateProxy

```swift
#if os(iOS) || os(tvOS)

import RxCocoa
import RxSwift
import UIKit

extension UITextField: HasDelegate {
    public typealias Delegate = UITextFieldDelegate
}

/// For more information take a look at `DelegateProxyType`.
open class RxTextFieldDelegateProxy
    : DelegateProxy<UITextField, UITextFieldDelegate>, DelegateProxyType, UITextFieldDelegate {

    public static func currentDelegate(for object: UITextField) -> UITextFieldDelegate? {
        return object.delegate
    }

    public static func setCurrentDelegate(_ delegate: UITextFieldDelegate?, to object: UITextField) {
        object.delegate = delegate
    }

    /// Typed parent object.
    public weak private(set) var textField: UITextField?

    /// - parameter textfield: Parent object for delegate proxy.
    public init(textField: ParentObject) {
        self.textField = textField
        super.init(parentObject: textField, delegateProxy: RxTextFieldDelegateProxy.self)
    }

    // Register known implementations
    public static func registerKnownImplementations() {
        register(make: RxTextFieldDelegateProxy.init)
    }

    // MARK: delegate methods
    /// For more information take a look at `DelegateProxyType`.
    @objc open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return forwardToDelegate()?.textFieldShouldReturn?(textField) ?? true
    }

    @objc open func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return forwardToDelegate()?.textFieldShouldClear?(textField) ?? true
    }
}

#endif
```

```swift
import RxCocoa
import RxSwift
import UIKit

public extension Reactive where Base: UITextField {

    /// Reactive wrapper for `delegate`.
    ///
    /// For more information take a look at `DelegateProxyType` protocol documentation.
    var delegate: DelegateProxy<UITextField, UITextFieldDelegate> {
        return RxTextFieldDelegateProxy.proxy(for: base)
    }

    /// Reactive wrapper for `delegate` message.
    var shouldReturn: ControlEvent<UITextField> {
        let source = delegate.rx.methodInvoked(#selector(UITextFieldDelegate.textFieldShouldReturn))
            .map { $0[0] as! UITextField }

        return ControlEvent(events: source)
    }

    var shouldClear: ControlEvent<Void> {
        let source = delegate.rx.methodInvoked(#selector(UITextFieldDelegate.textFieldShouldClear))
            .map { _ in }

        return ControlEvent(events: source)
    }

}
```

[lexrus/RxTextFieldDelegateProxy.swift](https://gist.github.com/lexrus/b1d32988be872bacc45241c217a6bfde)
