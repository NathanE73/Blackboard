## CGColor Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

![Autocomplete CGColor](Images/AutocompleteCGColor.gif)

### Xcode Asset Catalog

![Asset Color Dark Olive Green](Images/AssetColorDarkOliveGreen.png)

### Backboard Generated Code

[CGColor.blackboard.swift](/ExampleApp/Source/Generated/CGColor.blackboard.swift)

```swift
extension CGColor {
    static var absoluteZero: CGColor
    static var bisque: CGColor
    static var charcoal: CGColor
    static var darkOliveGreen: CGColor
    static var desire: CGColor
    static var emerald: CGColor
    static var firebrick: CGColor
    static var fluorescentBlizzardBlue: CGColor
    static var fluorescentMagicMint: CGColor
    static var fluorescentRadicalRed: CGColor
    static var maroon: CGColor
    static var night: CGColor
}
```

### The Blackboard Way

[ExampleApp](/ExampleApp/Source/FooterViewController.swift#L46)
```swift
view.layer.borderColor = .fluorescentBlizzardBlue
```

### The Standard UIKit Way

[StandardApp](/StandardApp/Source/FooterViewController.swift#L46)
```swift
view.layer.borderColor = UIColor(named: "Fluorescent/Blizzard Blue")?.cgColor
```
