## Dynamic image

```swift
// Dynamic UIImage referenced as follows:
//     https://gist.github.com/timonus/8b4feb47eccb6dde47ca6320d8fc6b11#gistcomment-3004630

@available(iOS 13.0, *)
private extension UIImage {
    /// Creates a dynamic image that supports displaying a different image asset when dark mode is active.
    static func dynamicImage(light makeLight: @autoclosure () -> UIImage,
                             dark makeDark: @autoclosure () -> UIImage) -> UIImage {
        let image = UITraitCollection(userInterfaceStyle: .light)
            .makeImage(makeLight())
        image.imageAsset?
            .register(makeDark(),
                      with: UITraitCollection(userInterfaceStyle: .dark))
        return image
    }
}

@available(iOS 13.0, *)
private extension UITraitCollection {
    /// Creates the provided image with traits from the receiver.
    func makeImage(_ makeImage: @autoclosure () -> UIImage) -> UIImage {
        var image: UIImage!
        performAsCurrent {
            image = makeImage()
        }
        return image
    }
}
```

[timonus/programmatic-dynamic-images.m](https://gist.github.com/timonus/8b4feb47eccb6dde47ca6320d8fc6b11)
