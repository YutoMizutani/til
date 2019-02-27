## Self sizing in UITableViewCell

```swift
// Expand textview area
let didChangeDescription = cell.addTodoView.descriptionTextView.rx.didChange.asObservable()
    .share(replay: 1)
didChangeDescription
    .subscribe(onNext: {
        // The cursor overlaps and disappears the lowermost area during animations of expanding text area
        // The same solution like with Twitter, LINE, and so on
        UIView.performWithoutAnimation {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    })
    .disposed(by: cell.rx.reuseBag)
```

[Embedding UITextView inside UITableViewCell](https://medium.com/@georgetsifrikas/embedding-uitextview-inside-uitableviewcell-9a28794daf01)
