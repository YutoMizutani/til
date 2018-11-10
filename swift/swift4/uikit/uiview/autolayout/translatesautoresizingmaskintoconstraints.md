## translatesAutoresizingMaskIntoConstraints

[Auto Layout と Manual Layout を混載させるときに役立つ UIView.translatesAutoresizingMaskIntoConstraints プロパティの話](http://akisute.com/2016/06/auto-layout-manual-layout.html)
> UIView.translatesAutoresizingMaskIntoConstraintsの値がtrueのときとfalseのときの違いについて以下に記載します（iOS 8以上で確認しています）。
>
> - trueのとき
>   - 対象のviewのframe、すなわちx, y, width, heightの4つの要素をview.frame, view.bounds および view.center プロパティから直接操作することが可能になります。これはAuto Layoutが導入される以前のiOSの世界と同じ状態です。この挙動をAuto Layoutとマッチさせるため、対象のviewのx, y, width, heightの4要素を指定された値に固定するようなAuto Layout Constraintsが自動的にシステムによってviewに挿入されます。この自動的に挿入されるAuto Layout Constraintsのpriorityは常に1000 (Required)になります。
> - falseのとき
>   - 対象のviewのframe、すなわちx, y, width, heightの4つの要素はすべてAuto Layoutエンジンが管理するようになり、view.frame, view.bounds および view.centerの値を直接書き換えても一切無視されるようになります。Auto Layout Constraintsが設定されていない場合、viewのframeはCGRect.zeroになります。

[Auto Layout と Manual Layout を混載させるときに役立つ UIView.translatesAutoresizingMaskIntoConstraints プロパティの話](http://akisute.com/2016/06/auto-layout-manual-layout.html)
[translatesAutoresizingMaskIntoConstraints - UIView | Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uiview/1622572-translatesautoresizingmaskintoco)
