## Transition using Storyboard

```swift
private func transition() {
    let storyboardID = "foo"
    let storyboard: UIStoryboard = UIStoryboard(name: storyboardID, bundle: nil)
    let nextViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: storyboardID)
    self.present(nextViewController, animated: true, completion: nil)
}
```

[同じ/異なるStoryboardでの画面遷移](https://qiita.com/kedarui/items/97b5cc1410d9c61933d5)
[Unable to instantiate UIStoryboard(name: “something”, bundle: nil)](https://stackoverflow.com/questions/44292526/unable-to-instantiate-uistoryboardname-something-bundle-nil)
[Segueを使わずにかっこよく画面遷移する方法を考えた](http://hiragram.hatenablog.jp/entry/2017/01/15/022116)
