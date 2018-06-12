## Fit UIImage to UIImageView in Swift4

UIImageView内のUIImageのサイズをUIImageViewに合わせる。
Swift4では`AVMakeRect(aspectRatio: <#CGSize#>, insideRect: <#CGRect#>)`で指定する。

このとき，`aspectRatio: `にはUIImageViewのUIImageを，`insideRect: `にはUIImageViewの親Viewを指定する。

```swift
guard let image = self.imageView.image else { return }
self.imageView.frame = AVMakeRect(aspectRatio: image.size, insideRect: self.view.bounds)
```

[UIImageViewの画像の表示領域を計算するExtension(UIImageView UIImage size計算)](https://qiita.com/KikurageChan/items/74146ca89a99402df851)
