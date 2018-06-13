## UIBarButtonItem

```swift
//
//  ViewController.swift
//  UIKit027_3.0
//
//  Created by KimikoWatanabe on 2016/08/13.
//  Copyright © 2016年 FaBo, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIToolbarDelegate{

    private var myToolbar: UIToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 背景を青色に変更する.
        self.view.backgroundColor = UIColor.cyan

        // ツールバーのサイズを決める.
        myToolbar = UIToolbar(frame: CGRect(x:0, y:self.view.bounds.size.height - 44, width:self.view.bounds.size.width, height:40.0))

        // ツールバーの位置を決める.
        myToolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-20.0)

        // ツールバーの色を決める.
        myToolbar.barStyle = .blackTranslucent
        myToolbar.tintColor = UIColor.white
        myToolbar.backgroundColor = UIColor.black

        // ボタン１を生成する.
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "Green", style:.plain, target: self, action: #selector(ViewController.onClickBarButton(sender:)))
        myUIBarButtonGreen.tag = 1

        // ボタン２を生成する.
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "Blue", style:.plain, target: self, action: #selector(ViewController.onClickBarButton(sender:)))
        myUIBarButtonBlue.tag = 2

        // ボタン3を生成する.
        let myUIBarButtonRed: UIBarButtonItem = UIBarButtonItem(title: "Red", style:.plain, target: self, action: #selector(ViewController.onClickBarButton(sender:)))
        myUIBarButtonRed.tag = 3

        // ボタンをツールバーに入れる.
        myToolbar.items = [myUIBarButtonGreen, myUIBarButtonBlue, myUIBarButtonRed]

        // ツールバーに追加する.
        self.view.addSubview(myToolbar)
    }

    /*
     UIBarButtonItemが押された際に呼ばれる.
     */
    internal func onClickBarButton(sender: UIBarButtonItem) {

        switch sender.tag {
        case 1:
            self.view.backgroundColor = UIColor.green
        case 2:
            self.view.backgroundColor = UIColor.blue
        case 3:
            self.view.backgroundColor = UIColor.red
        default:
            print("ERROR!!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
```

[<Swift> 隠れUIBarButtonItemを出現させる](https://qiita.com/mshrwtnb/items/327e8342c4d7aefe4853)
[Toolbars](https://developer.apple.com/design/human-interface-guidelines/ios/bars/toolbars/)
[UIToolbar](https://developer.apple.com/documentation/uikit/uitoolbar)
[UIBarButtonSystemItemFixedSpace](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/uibarbuttonsystemitemfixedspace)
[UIBarButtonItem.SystemItem](https://developer.apple.com/documentation/uikit/uibarbuttonitem/systemitem)
[UItoolBarの表示](http://docs.fabo.io/swift/uikit/027_uitoolbar.html)

[ViewControllerのToolBarを出したり消したり](https://qiita.com/hellful/items/a5dd000e313d00087e63)
[setToolbarHidden(_:animated:)](https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621888-settoolbarhidden)
