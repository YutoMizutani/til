## Sink UIScrollView

```swift
func addScrollView() {
    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    let numberOfPages: CGFloat = 4
    scrollView.contentSize = CGSize(width: scrollView.frame.width * numberOfPages, height: scrollView.frame.height * numberOfPages)
    scrollView.delegate = self
    scrollView.isPagingEnabled = true

    let pageControl = UIPageControl(frame: CGRect(x: 0, y: scrollView.frame.height - 37, width: scrollView.frame.width, height: 37))
    pageControl.numberOfPages = Int(numberOfPages)
    pageControl.currentPage = 0
}

func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let value = scrollView.contentOffset.x / scrollView.frame.size.width
    pageControl.currentPage = Int(round(value))
}
```

[Programmatically Linking UIPageControl to UIScrollView](https://stackoverflow.com/a/50339080)
