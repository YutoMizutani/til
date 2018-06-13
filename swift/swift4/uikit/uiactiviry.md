## UIActivity

SafariのUIBarButtonItem.SystemItem.action等からSNS等に共有するメニューのコントロール。
`import Accounts`が必要。

[nashirox/uiactivity-sample/uiactivity-sample/ViewController.swift](https://github.com/nashirox/uiactivity-sample/blob/master/uiactivity-sample/ViewController.swift)
```swift
//
//  ViewController.swift
//  uiactivity-sample
//
//  Created by nashirox on 2016/08/29.
//  Copyright © 2016年 test. All rights reserved.
//
import UIKit
import Accounts

class ViewController: UIViewController {

    @IBAction func share(sender: AnyObject) {
        // 共有する項目
        let shareText = "Apple - Apple Watch"
        let shareWebsite = NSURL(string: "https://www.apple.com/jp/watch/")!
        let shareImage = UIImage(named: "shareSample")!

        let activityItems = [shareText, shareWebsite, shareImage]

        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivityTypePostToFacebook,
            UIActivityTypePostToTwitter,
            UIActivityTypeMessage,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypePrint
        ]

        activityVC.excludedActivityTypes = excludedActivityTypes

        // UIActivityViewControllerを表示
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
```

[[Swift]UIActivityの使い方まとめ](https://qiita.com/nashirox/items/56894599013d712faa0a)
