## TitleView

#### Set (initialize)

```swift
self.navigationItem.titleView = SwitchableTitleView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
```

#### Fit view

```swift
override var intrinsicContentSize: CGSize {
    return UILayoutFittingExpandedSize
}
```

[titleView](https://developer.apple.com/documentation/uikit/uinavigationitem/1624935-titleview)
[iOS11でnavigationItem.titleViewにセットしたViewの表示位置がずれる](http://myamamic.hatenablog.jp/entry/2018/03/07/194029)
[iOS 11 navigationItem.titleView Width Not Set](https://stackoverflow.com/questions/44932084/ios-11-navigationitem-titleview-width-not-set)
[UINavigationBarをちゃんと理解する。](http://glayash.blogspot.com/2012/12/uinavigationbar.html)
