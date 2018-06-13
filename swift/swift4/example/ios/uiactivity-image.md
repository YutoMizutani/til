## UIActivity using image on iOS

`UIActivityViewController`を利用して共有や保存をするActivityを呼び出す。
*`Privacy - Photo Library Additions Usage Description`を設定しないと保存時にクラッシュする。*

```swift
extension UIViewController {
    func presentActivity(image: UIImage) {
        let activityItems = [image]

        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

        // 使用しないアクティビティタイプ
        let excludedActivityTypes: [UIActivity.ActivityType] = []

        activityVC.excludedActivityTypes = excludedActivityTypes

        // UIActivityViewControllerを表示
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
}
```
