## Adding a Custom Font to Your App

1. Add the Font File to Your Xcode Project
2. Register Your Font File with iOS (to "Fonts provided by application" to Info.plist (the raw key name is UIAppFonts))
3.1. Use Your Custom Font in Interface Builder
3.2. Use Your Custom Font in Source Code

```swift
for family in UIFont.familyNames.sorted() {
    let names = UIFont.fontNames(forFamilyName: family)
    print("Family: \(family) Font names: \(names)")
}
```

```swift
guard let customFont = UIFont(name: "CustomFont-Light", size: UIFont.labelFontSize) else {
    fatalError("""
        Failed to load the "CustomFont-Light" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
    )
}
label.font = UIFontMetrics.default.scaledFont(for: customFont)
label.adjustsFontForContentSizeCategory = true
```

[Adding a Custom Font to Your App](https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app)
