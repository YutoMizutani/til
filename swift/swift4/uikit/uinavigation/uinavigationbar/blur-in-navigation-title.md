## Blur in navigation title

```swift
extension UINavigationBar {
    func installBlurEffect() {
        isTranslucent = true
        setBackgroundImage(UIImage(), for: .default)
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
        var blurFrame = bounds
        blurFrame.size.height += statusBarHeight
        blurFrame.origin.y -= statusBarHeight
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.isUserInteractionEnabled = false
        blurView.frame = blurFrame
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurView)
        blurView.layer.zPosition = -1
    }
}

navigationController.navigationBar.installBlurEffect()
```

[ios navigationitem title - ナビゲーションバーのリアルタイムぼかし効果](https://code.i-harness.com/ja-jp/q/1a0b32a)
[iOS 7.0.3からナビゲーションバーにtintColorを指定すると半透明じゃなくなった](https://qiita.com/yimajo/items/4781d5d2712e34677db2)
