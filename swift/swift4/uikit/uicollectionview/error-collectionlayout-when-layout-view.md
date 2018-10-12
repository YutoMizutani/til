## Error CollectionLayout when layout view

To fix below error,

```
Exception Type:  SIGABRT
Exception Codes: #0 at 0x184e8d348
Crashed Thread:  0

Application Specific Information:
*** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[__NSDictionaryM setObject:forKey:]: key cannot be nil'
```

```swift
override func layoutSubviews() {
  super.layoutSubviews()

  if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
    // foo
  }
}
```

[[IGListAdapterUpdater performBatchUpdatesWithCollectionView:] #1034](https://github.com/Instagram/IGListKit/issues/1034)
[CollectionViewで UICollectionViewLayout を使っている場合に画面回転時にセルサイズを変える方法](https://qiita.com/YKEI_mrn/items/e3c313bdef0f8cfc0709)

##### NOTE

`func layoutSubviews()` 内で `collectionView.collectionViewLayout` は `nil` となる可能性がある。
