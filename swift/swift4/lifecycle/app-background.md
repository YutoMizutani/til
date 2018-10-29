## Call functions when the app background and forground

```
1:-[FirstViewController viewDidLoad]
1:-[FirstViewController viewWillAppear:]
1:-[FirstViewController viewDidAppear:]

2:-[SecondViewController viewDidLoad]
2:-[SecondViewController viewWillAppear:]
1:-[FirstViewController viewWillDisappear:]
1:-[FirstViewController viewDidDisappear:]
2:-[SecondViewController viewDidAppear:]

1:-[FirstViewController viewWillAppear:]
2:-[SecondViewController viewWillDisappear:]
2:-[SecondViewController viewDidDisappear:]
1:-[FirstViewController viewDidAppear:]
```

![](https://camo.qiitausercontent.com/dd997635c6293330b953665dff09b33f03ee5d5c/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f35333832332f62323739623239642d396635622d303934352d373230362d6562356161333539373432632e706e67)
![](https://camo.qiitausercontent.com/af7b161dbba4c2644ca996ec74b7bf4f53712b41/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f34353532352f36373064303033382d366630332d303935662d636132322d3930633531306638626162662e706e67)

[UIViewControllerのライフサイクル](https://qiita.com/motokiee/items/0ca628b4cc74c8c5599d)
[iPhoneアプリのライフサイクル](https://qiita.com/fujisan3/items/8051940e3f2063808df9)
