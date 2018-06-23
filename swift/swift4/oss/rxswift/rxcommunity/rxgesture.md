## RxGesture

[RxSwiftCommunity/RxGesture](https://github.com/RxSwiftCommunity/RxGesture)

Swiftの`ControlEvent`をrx記法で書けるライブラリ。
複数のジェスチャーを登録することもできる。

#### Usage

```swift
view.rx
  .tapGesture()
  .when(.recognized)
  .subscribe(onNext: { _ in
    //react to taps
  })
  .disposed(by: stepBag)
```

```swift
view.rx
  .anyGesture(.tap(), .swipe([.up, .down]))
  .when(.recognized)
  .subscribe(onNext: { _ in
    //dismiss presented photo
  })
  .disposed(by: stepBag)
```

#### Filtering State

| Kind | States |
|--|--|
| `.tap()` `.click()` `.rightClick()` .swipe() | `.recognized` |
| `.longPress()` `.press()` | `.began` |
| .`pan()` `.pinch()` `.rotation()` `.magnification()` `.screenEdgePan()` | `.began` `.changed` `.ended` |

#### iOS

On iOS, RxGesture supports:
```swift
view.rx.tapGesture()           -> ControlEvent<UITapGestureRecognizer>
view.rx.pinchGesture()         -> ControlEvent<UIPinchGestureRecognizer>
view.rx.swipeGesture(.left)    -> ControlEvent<UISwipeGestureRecognizer>
view.rx.panGesture()           -> ControlEvent<UIPanGestureRecognizer>
view.rx.longPressGesture()     -> ControlEvent<UILongPressGestureRecognizer>
view.rx.rotationGesture()      -> ControlEvent<UIRotationGestureRecognizer>
view.rx.screenEdgePanGesture() -> ControlEvent<UIScreenEdgePanGestureRecognizer>

view.rx.anyGesture(.tap(), ...)           -> ControlEvent<UIGestureRecognizer>
view.rx.anyGesture(.pinch(), ...)         -> ControlEvent<UIGestureRecognizer>
view.rx.anyGesture(.swipe(.left), ...)    -> ControlEvent<UIGestureRecognizer>
view.rx.anyGesture(.pan(), ...)           -> ControlEvent<UIGestureRecognizer>
view.rx.anyGesture(.longPress(), ...)     -> ControlEvent<UIGestureRecognizer>
view.rx.anyGesture(.rotation(), ...)      -> ControlEvent<UIGestureRecognizer>
view.rx.anyGesture(.screenEdgePan(), ...) -> ControlEvent<UIGestureRecognizer>
```

#### macOS

On macOS, RxGesture supports:
```swift
view.rx.clickGesture()         -> ControlEvent<NSClickGestureRecognizer>
view.rx.rightClickGesture()    -> ControlEvent<NSClickGestureRecognizer>
view.rx.panGesture()           -> ControlEvent<NSPanGestureRecognizer>
view.rx.pressGesture()         -> ControlEvent<NSPressGestureRecognizer>
view.rx.rotationGesture()      -> ControlEvent<NSRotationGestureRecognizer>
view.rx.magnificationGesture() -> ControlEvent<NSMagnificationGestureRecognizer>

view.rx.anyGesture(.click(), ...)         -> ControlEvent<NSGestureRecognizer>
view.rx.anyGesture(.rightClick(), ...)    -> ControlEvent<NSGestureRecognizer>
view.rx.anyGesture(.pan(), ...)           -> ControlEvent<NSGestureRecognizer>
view.rx.anyGesture(.press(), ...)         -> ControlEvent<NSGestureRecognizer>
view.rx.anyGesture(.rotation(), ...)      -> ControlEvent<NSGestureRecognizer>
view.rx.anyGesture(.magnification(), ...) -> ControlEvent<NSGestureRecognizer>
```

[RxSwiftCommunity/RxGesture](https://github.com/RxSwiftCommunity/RxGesture)
