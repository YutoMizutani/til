## Empty data set view breaks "pull to refresh"

```swift
func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
    return true
}

func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
    return true
}
```

[Empty data set view breaks "pull to refresh"](https://github.com/dzenbot/DZNEmptyDataSet/issues/43)
