## Swipe to delete using RxSwift

```swift
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    /// Delete todo trigger
    private let deleteTrigger: PublishRelay<IndexPath> = PublishRelay()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Enable to edit cells
        tableView.configureDataSource.canEditRowAtIndexPath = { _, _ in
            return true
        }
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate {
    /// Set swipe actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let destructiveAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completion in
            // Notice to ViewModel
            self?.deleteTrigger.accept(indexPath)
            // Delete cell animation (data source is not changed)
            completion(true)
        }
        return UISwipeActionsConfiguration(actions: [destructiveAction])
    }
}
```

[Swipe to delete not working #257 - RxSwiftCommunity/RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources/issues/257)
[How to add swipe to delete #192 - RxSwiftCommunity/RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources/issues/192)
[Enable slide to delete in UITableView.](https://medium.com/ios-os-x-development/enable-slide-to-delete-in-uitableview-9311653dfe2)
[[iOS 11] iOS 11でUITableViewDelegateに追加されたメソッドを使ってスワイプアクションを実装する](https://dev.classmethod.jp/smartphone/iphone/ios-11-new-swipe-action-methods/)
[【Xcode】iOS11からUITableViewのSwipe Actionが新しくなった](http://an.hatenablog.jp/entry/2017/10/23/225424)
