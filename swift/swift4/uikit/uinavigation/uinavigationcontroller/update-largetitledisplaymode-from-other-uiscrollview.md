## Update navigationItem.largeTitleDisplayMode from other UIScrollView

```swift
class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!

    private var canTransitionToLarge = false
    private var canTransitionToSmall = true

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .always
        }

        scrollView.delegate = self
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if canTransitionToLarge && scrollView.contentOffset.y <= 0 {
            showNavigationTitle()
        } else if canTransitionToSmall && scrollView.contentOffset.y > 0 {
            hideNavigationTitle()
        }
    }

    fileprivate func showNavigationTitle() {
        guard #available(iOS 11.0, *) else { return }
        self.navigationItem.largeTitleDisplayMode = .always
        UIView.animate(withDuration: 0.25) {
            self.navigationController?.navigationBar.sizeToFit()
        }
        canTransitionToLarge = false
        canTransitionToSmall = true
    }

    fileprivate func hideNavigationTitle() {
        guard #available(iOS 11.0, *) else { return }
        self.navigationItem.largeTitleDisplayMode = .never
        UIView.animate(withDuration: 0.25) {
            self.navigationController?.navigationBar.sizeToFit()
        }
        canTransitionToLarge = true
        canTransitionToSmall = false
    }
}
```

[Change page on UIScrollView](https://stackoverflow.com/questions/1926810/change-page-on-uiscrollview)
