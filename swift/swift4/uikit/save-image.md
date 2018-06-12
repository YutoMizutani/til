## Save image

```swift
private extension NSObject {
    private var completion: (_ error: Error?) -> Void!

    func save(image: UIImage, completion: @escaping (_ error: Error?) -> Void) {
        self.completion = completion
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc
    private func saveImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        completion(error)
    }
}
```

[Swiftで画像を保存する時の実行時エラー](https://qiita.com/shtnkgm/items/50cc3e78948ff44c7d88)
