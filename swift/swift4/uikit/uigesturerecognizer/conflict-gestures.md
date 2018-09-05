## Conflict gestures

`tapGestureRecognizer.cancelsTouchesInView = false`

[UITapGestureRecognizer を設定すると他ViewへのTapを認識しなくなる](https://qiita.com/RS_Dessin/items/f1d337289589b4c5f551)
> cancelsTouchesInView プロパティにfalseを渡せばOK。

```swift
let tapGestureRecognizer= UITapGestureRecognizer(target: self, action: #selector(tapGesture))
tapGestureRecognizer.cancelsTouchesInView = false
```

[UITapGestureRecognizer を設定すると他ViewへのTapを認識しなくなる](https://qiita.com/RS_Dessin/items/f1d337289589b4c5f551)
[UIGestureRecognizer が競合した時に制御する方法](http://www.minimalab.com/blog/2015/02/22/uigesturerecognizer-conflict/)
[UITapGestureRecognizerとUICollectionViewが競合した場合](http://blog.fujimisakari.com/about_uitapgesturerecognizer_and_uicollectionview/)
