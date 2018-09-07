## Improve hide view

```swift
NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
```

```swift
extension UITableView {
    public func reloadData(_ completion: @escaping (Bool) -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { bool in
            completion(bool)
        })
    }
}

// キーボードが現れた時に、画面全体をずらす。
@objc func keyboardWillShow(_ notification: Notification?) {
    guard self.view.transform == CGAffineTransform.identity else { return }
    guard let rect = (notification?.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
    let duration: TimeInterval? = notification?.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
    let transform = CGAffineTransform(translationX: 0, y: -rect.size.height)
    UIView.animate(withDuration: duration!, animations: { [weak self] in
        self?.view.transform = transform
    }, completion: { [weak self] bool in
        if !bool { self?.view.transform = transform }
    })
}

// キーボードが消えたときに、画面を戻す
@objc func keyboardWillHide(_ notification: Notification?) {
    guard self.view.transform != CGAffineTransform.identity else { return }
    let duration: TimeInterval? = notification?.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Double
    UIView.animate(withDuration: duration!, animations: { [weak self] in
        self?.view.transform = CGAffineTransform.identity
    }, completion: { [weak self] bool in
        if !bool { self?.view.transform = CGAffineTransform.identity }
    })
}
```

[https://qiita.com/ShinokiRyosei/items/06fb30983236d6342b28](https://qiita.com/ShinokiRyosei/items/06fb30983236d6342b28)
