## autoresizingMask

I was read [the repository](https://github.com/tattn/BackgroundVideoSample), I met `label.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]` code.

[UIKit Documentation](https://developer.apple.com/documentation/uikit/uiview/1622559-autoresizingmask)
> An integer bit mask that determines how the receiver resizes itself when its superview’s bounds change.

```swift
// UIView.h

public struct UIViewAutoresizing : OptionSet {

    public init(rawValue: UInt)

    
    public static var flexibleLeftMargin: UIViewAutoresizing { get }

    public static var flexibleWidth: UIViewAutoresizing { get }

    public static var flexibleRightMargin: UIViewAutoresizing { get }

    public static var flexibleTopMargin: UIViewAutoresizing { get }

    public static var flexibleHeight: UIViewAutoresizing { get }

    public static var flexibleBottomMargin: UIViewAutoresizing { get }
}
```

<br>

[プログラムによるSubview配置 その3](http://blogios.stack3.net/archives/54)

> viewDidLoadでButtonのframeを設定するときに一緒にこれらを設定しています。

> ...

> UIViewAutoresizingFlexibleWidthとUIViewAutoresizingFlexibleHeightはSuperviewと同じサイズに合わせるためのものではありません。Superviewのboundsの変化に合わせて自身のサイズを合わせるものです。

> 今回Buttonのサイズがself.view.boundsと同じになるのは、viewDidLoadでframeに同じサイズにしているからです。

> 試しにButtonのframeをCGRectZeroにして起動してみましょう。

> ...

> 何も表示されません。Buttonのサイズが0であるため、Superviewのboundsが変更されてもサイズを変更する必要がないと判断されているからです。

設定時のサイズに合わせてサイズを自動で変更する。