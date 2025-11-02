## UIColor Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

![Autocomplete UIColor](Images/AutocompleteUIColor.gif)

### Xcode Asset Catalog

![Asset Color Dark Olive Green](Images/AssetColorDarkOliveGreen.png)

### Backboard Generated Code

[ColorAsset.blackboard.swift](/ExampleApp/Source/Generated/ColorAsset.blackboard.swift#L9)

```swift
public enum ColorAsset: String {
    case absoluteZero = "Absolute Zero"
    case bisque = "Bisque"
    case charcoal = "Charcoal"
    case darkOliveGreen = "dark-olive-green"
    case desire = "Desire"
    case emerald = "Emerald"
    case empty = "Empty"
    case firebrick = "firebrick-color"
    case fluorescentBlizzardBlue = "Fluorescent/Blizzard Blue"
    case fluorescentMagicMint = "Fluorescent/Magic Mint"
    case fluorescentRadicalRed = "Fluorescent/Radical Red"
    case maroon = "maroon color"
    case night = "Night"
}
```

[UIColor.blackboard.swift](/ExampleApp/Source/Generated/UIColor.blackboard.swift#L14)

```swift
public extension ColorAsset {
    var color: UIColor
}

public extension UIColor {
    init(asset: ColorAsset, compatibleWith traitCollection: UITraitCollection? = nil)
    
    static var absoluteZero: UIColor
    static var bisque: UIColor
    static var charcoal: UIColor
    static var darkOliveGreen: UIColor
    static var desire: UIColor
    static var emerald: UIColor
    static var empty: UIColor
    static var firebrick: UIColor
    static var fluorescentBlizzardBlue: UIColor
    static var fluorescentMagicMint: UIColor
    static var fluorescentRadicalRed: UIColor
    static var maroon: UIColor
    static var night: UIColor
}
```

### The Blackboard Way

[ExampleApp](/ExampleApp/Source/FooterViewController.swift#L43)
```swift
view.backgroundColor = .fluorescentMagicMint

view.backgroundColor = UIColor(asset: .fluorescentMagicMint)
view.backgroundColor = UIColor(asset: .fluorescentMagicMint, compatibleWith: traitCollection)
```

### The Standard UIKit Way

```swift
view.backgroundColor = UIColor(named: "Fluorescent/Magic Mint")
view.backgroundColor = UIColor(named: "Fluorescent/Magic Mint", compatibleWith: traitCollection)

```
