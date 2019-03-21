## Hide tabbar when transition

`hidesBottomBarWhenPushed`

```objc
UIViewController *viewController = /* init */;
viewController.hidesBottomBarWhenPushed = YES;
[self.navigationController pushViewController:viewController animated:YES];
```

[pushViewControllerしたとき、tabBarも一緒に隠す方法](https://qiita.com/kei_q/items/ae918cfaf146ab2f7d43)
