## Swipe dismissable

```swift
class PannableViewController: UINavigationController {
    public var minimumVelocityToHide = 1500 as CGFloat
    public var minimumScreenRatioToHide = 0.3 as CGFloat
    public var animationDuration = 0.2 as TimeInterval

    private lazy var transitionDelegate: TransitionDelegate = TransitionDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transitionDelegate

        // Listen for pan gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))

        if let lastVC = self.childViewControllers.last {
            lastVC.view.addGestureRecognizer(panGesture)
        }
    }

    @objc func onPan(_ panGesture: UIPanGestureRecognizer) {

        let translation = panGesture.translation(in: self.view)
        let verticalMovement = translation.y / self.view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)

        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)

        let velocity = panGesture.velocity(in: self.view)
        let shouldFinish = progress > self.minimumScreenRatioToHide || velocity.y > self.minimumVelocityToHide

        switch panGesture.state {
        case .began:
            self.transitionDelegate.interactiveTransition.hasStarted = true
            self.dismiss(animated: true, completion: nil)
        case .changed:
            self.transitionDelegate.interactiveTransition.shouldFinish = shouldFinish
            self.transitionDelegate.interactiveTransition.update(progress)
        case .cancelled:
            self.transitionDelegate.interactiveTransition.hasStarted = false
            self.transitionDelegate.interactiveTransition.cancel()
        case .ended:
            self.transitionDelegate.interactiveTransition.hasStarted = false
            self.transitionDelegate.interactiveTransition.shouldFinish ? self.transitionDelegate.interactiveTransition.finish() : self.transitionDelegate.interactiveTransition.cancel()
        default:
            break
        }
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen;
        self.modalTransitionStyle = .coverVertical;
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.modalPresentationStyle = .overFullScreen;
        self.modalTransitionStyle = .coverVertical;
    }
}
```

```swift
class Transition {
    public var isPresenting: Bool = false
    public var presentDuration: TimeInterval = 0.5
    public var dismissDuration: TimeInterval = 0.5
}

class TransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    lazy var transition: Transition = Transition()
    lazy var interactiveTransition: InteractiveTransition = InteractiveTransition()

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        self.transition.isPresenting = true
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.transition.isPresenting = false
        return self
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactiveTransition.hasStarted ? self.interactiveTransition : nil
    }
}


extension TransitionDelegate:  UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.transition.isPresenting ? self.transition.presentDuration : self.transition.dismissDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
                transitionContext.completeTransition(false)
                return
        }

        let containerView = transitionContext.containerView
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        if self.transition.isPresenting {

            let finalFrameForVC = transitionContext.finalFrame(for: toVC)
            toVC.view.frame = finalFrameForVC.offsetBy(dx: 0, dy: UIScreen.main.bounds.size.height)
            containerView.addSubview(toVC.view)

            // Additional ways to animate, Spring velocity & damping
            UIView.animate(withDuration: self.transition.presentDuration,
                           delay: 0.0,
                           options: .transitionCrossDissolve,
                           animations: {
                            toVC.view.frame = finalFrameForVC
            }, completion: { _ in
                transitionContext.completeTransition(true)
            })

        } else {

            var finalFrame = fromVC.view.frame
            finalFrame.origin.y += finalFrame.height

            // Additional ways to animate, Spring velocity & damping
            UIView.animate(withDuration: self.transition.dismissDuration,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            fromVC.view.frame = finalFrame
                            toVC.view.alpha = 1.0
            },
                           completion: { _ in
                            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
}
```

[Using pan down to dismiss a UINavigationController resizes the UINavigationBar with respect to the top safe area](https://stackoverflow.com/questions/50546494/using-pan-down-to-dismiss-a-uinavigationcontroller-resizes-the-uinavigationbar-w)
