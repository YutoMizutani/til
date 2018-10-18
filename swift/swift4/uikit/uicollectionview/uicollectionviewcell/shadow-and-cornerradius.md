## Shadow and CornerRadius.md

```swift
let cell = UICollectionViewCell()
cell.backgroundColor = UIColor.clear
cell.contentView.layer.cornerRadius = 5
cell.contentView.backgroundColor = UIColor.white
cell.contentView.clipsToBounds = true
cell.layer.shadowColor = UIColor.black.cgColor
cell.layer.shadowOffset = CGSize(width: 2.5, height: 5)
cell.layer.shadowRadius = 5
cell.layer.shadowOpacity = 0.5
cell.clipsToBounds = false
```
