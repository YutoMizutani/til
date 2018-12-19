## rx.selectedIndex

```swift
extension Reactive where Base: UITabBarController {
    var selectedIndex: Observable<Int> {
        return observeWeakly(UIViewController.self, "selectedViewController")
            .flatMap { $0.map { Observable.just($0) } ?? Observable.empty() }
            .flatMap { [weak base] in
                return base?.viewControllers?.index(of: $0)
                    .map { Observable.just($0) } ?? Observable.empty()
            }
            .share(replay: 1)
    }
}
```

[UITabBarControllerのselectedIndexをObserveする](https://tech-blog.sgr-ksmt.org/2016/12/27/uitabbarcontroller_rx/)
