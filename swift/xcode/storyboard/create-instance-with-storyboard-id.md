## Create instance with Storyboard ID

```swift
let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
let nextView = storyboard.instantiateInitialViewController()
present(nextView!, animated: true, completion: nil)
```

[【Swift3】コードで画面遷移を行う方法](https://qiita.com/Simmon/items/6c3d6bcd6bfffbfd970d)
[Storyboard IDを指定してViewControllerを作る](https://tech.mokelab.com/ios/UIKit/UIStoryboard/instantiateViewController.html)
