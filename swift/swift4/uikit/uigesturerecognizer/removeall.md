## Remove all gestures

```swift
self.view.gestureRecognizers?.forEach({ [weak self] in self?.view.removeGestureRecognizer($0) })
```

[How to remove all gesture recognizers from a UIView in Swift](https://stackoverflow.com/questions/26206452/how-to-remove-all-gesture-recognizers-from-a-uiview-in-swift)
