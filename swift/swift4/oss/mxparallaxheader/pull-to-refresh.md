## Pull to refresh using MXParallaxHeader

```swift
extension ViewController: MXParallaxHeaderDelegate {
    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {
        // Pull to refresh
        if parallaxHeader.progress > 8 && !isRefreshing {
            let impactFeedback = UIImpactFeedbackGenerator(style: .light)
            impactFeedback.prepare()
            isRefreshing = true
            impactFeedback.impactOccurred()
        } else if parallaxHeader.progress == 0 {
            isRefreshing = false
        }
    }
}

```
