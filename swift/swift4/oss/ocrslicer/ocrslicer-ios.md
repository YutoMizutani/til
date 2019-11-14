## OCRSlicer iOS

> [OCRSlicer/Example/OCR test/OCR test/ViewController.swift](https://github.com/robertoferraz/OCRSlicer/blob/master/Example/OCR%20test/OCR%20test/ViewController.swift)

```swift
import OCRSlicer

OCRSlicer().sliceaAndOCR(image: image, charWhitelist: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxwyz1234567890") { [unowned self] text, image in
    if self.slice1ImageView.image == nil {
        self.slice1ImageView.image = image
        self.slice1Label.text = text
    } else {
        self.slice2ImageView.image = image
        self.slice2Label.text = text
    }
}
```

[OCRSlicer iOS](https://github.com/robertoferraz/OCRSlicer)
