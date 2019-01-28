## ContainerView

```swift
import UIKit

class ContainerView: UIView {
    private weak var parentViewController: UIViewController?
    var parent: UIViewController? {
        return parentViewController
    }
    var viewController: UIViewController = UIViewController() {
        didSet {
            oldValue.removeFromParent()
            addViewController()
            layoutView()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override private init(frame: CGRect) {
        super.init(frame: frame)
    }

    required convenience init(_ viewController: UIViewController, parent parentViewController: UIViewController, frame: CGRect = .zero) {
        self.init(frame: frame)

        self.viewController = viewController
        self.parentViewController = parentViewController
        configureView()
        layoutView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutView()
        layoutIfNeeded()
    }

    private func configureView() {
        backgroundColor = .clear
        addViewController()
    }

    private func addViewController() {
        guard parentViewController != nil else { return }
        parentViewController?.addChild(viewController)
        addSubview(viewController.view)
        viewController.didMove(toParent: parentViewController)
    }

    /// Layout views
    private func layoutView() {
        frame = viewController.view.bounds
    }
}
```

[How to add a Container View programmatically](https://stackoverflow.com/questions/37370801/how-to-add-a-container-view-programmatically)
[カスタムContainer View Controllerを作る](https://qiita.com/edo_m18/items/8b6b457f82b185ab1f6a)
