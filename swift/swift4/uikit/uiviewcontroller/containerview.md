## ContainerView

```swift
import UIKit

class ContainerViewController: UIViewController {
    // Container viewControllers
    @IBOutlet weak var containerView: UIView!
    var contentViewController: UIViewController! {
        didSet {
            guard let contentViewController = self.contentViewController else { return }
            oldValue?.willMove(toParentViewController: nil)
            oldValue?.view.removeFromSuperview()
            oldValue?.removeFromParentViewController()

            self.addChildViewController(contentViewController)
            contentViewController.didMove(toParentViewController: self)
            guard self.isViewLoaded else {
                return
            }
            self.configureContentView()
        }
    }

    /// ContentViewの要素を設定する
    private func configureContentView() {
        guard let contentViewController = self.contentViewController else { return }

        // 二重呼び出しを防止する
        let isAlreadyAdded = contentViewController.isViewLoaded && self.containerView.subviews.contains(contentViewController.view)
        guard isAlreadyAdded == false else { return }

        contentViewController.view.frame = self.containerView.bounds
        self.containerView.addSubview(contentViewController.view)
    }
}
```
