## UIImageView set contentMode

```swift
imageView.contentMode = .scaleAspectFit
```

```objc
typedef enum {
   UIViewContentModeScaleToFill,        // これがデフォルト。UIImageViewにめいっぱいひろげる
   UIViewContentModeScaleAspectFit,     // 画像のaspect比を維持し、ちょうどはいるようにする
   UIViewContentModeScaleAspectFill,    // 画像のaspect比を維持し、めいっぱい広げる（はみ出した分がみれなくなる）
   UIViewContentModeRedraw,             // UIViewContentModeScaleToFill これと同じに見えるけどなんだろう・・
   UIViewContentModeCenter,             // 画像サイズをそのままに、真ん中を表示
   UIViewContentModeTop,                //                         上を
   UIViewContentModeBottom,             //                         下を
   UIViewContentModeLeft,               //                         左を
   UIViewContentModeRight,              //                         右を
   UIViewContentModeTopLeft,            //                         左上を
   UIViewContentModeTopRight,           //                         右上を
   UIViewContentModeBottomLeft,         //                         左下を
   UIViewContentModeBottomRight,        //                         右下を
} UIViewContentMode;
```

[[iphone][cocoa]画像サイズにあわせてUIImageViewに貼付ける](http://d.hatena.ne.jp/rnamiki/20090226/1235667228)
