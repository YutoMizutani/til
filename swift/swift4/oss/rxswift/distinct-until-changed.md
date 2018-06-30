## distinctUntilChanged

前回と値が同じ場合にStreamを流さない

```swift
let stream = [1, 2, 3, 1, 1, 4].toObservable()
_ = stream
  .distinctUntilChanged()
  .subscribe {
    print($0) // 1, 2, 3, 1, 4
  }
```

[RxSwiftのオペレータdistinctUntilChangedに混乱した](http://seiya-orz.hatenablog.com/entry/2017/08/18/001251)
> 普通に0--1--0の0が流れてる！おや？？となってよく見ると、
> ...
> distinctとdistinctUntilChangedは違うし、RxSwiftにはそもそもdistinctはなさそう。

[RxSwift 入門 その４](http://tiny-wing.hatenablog.com/entry/2016/01/17/182911)
[RxSwiftのオペレータdistinctUntilChangedに混乱した](http://seiya-orz.hatenablog.com/entry/2017/08/18/001251)
[distinctUntilChanged - RxJS Marbles](http://rxmarbles.com/#distinctUntilChanged)
[Reactive Extensions再入門 その２３「重複を排除するメソッド」](https://blog.okazuki.jp/entry/20120104/1325679391)
