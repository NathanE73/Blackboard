## UIColor Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

![Autocomplete UIColor](Images/AutocompleteUIColor.gif)

### Xcode Asset Catalog

![Asset Color Dark Olive Green](Images/AssetColorDarkOliveGreen.png)

### Backboard Generated Code

[ColorAsset.blackboard.swift](/ExampleApp/Source/Generated/ColorAsset.blackboard.swift)

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

[UIColor.blackboard.swift](/ExampleApp/Source/Generated/UIColor.blackboard.swift)

```swift
public extension ColorAsset {
    var color: UIColor { return UIColor(self) }
}

public extension UIColor {
    
    convenience init(_ colorAsset: ColorAsset, compatibleWith traitCollection: UITraitCollection? = nil) {
        self.init(named: colorAsset.rawValue, in: bundle, compatibleWith: traitCollection)!
    }
    
    static var absoluteZero: UIColor { return UIColor(.absoluteZero) }
    static var bisque: UIColor { return UIColor(.bisque) }
    static var charcoal: UIColor { return UIColor(.charcoal) }
    static var darkOliveGreen: UIColor { return UIColor(.darkOliveGreen) }
    static var desire: UIColor { return UIColor(.desire) }
    static var emerald: UIColor { return UIColor(.emerald) }
    static var empty: UIColor { return UIColor(.empty) }
    static var firebrick: UIColor { return UIColor(.firebrick) }
    static var fluorescentBlizzardBlue: UIColor { return UIColor(.fluorescentBlizzardBlue) }
    static var fluorescentMagicMint: UIColor { return UIColor(.fluorescentMagicMint) }
    static var fluorescentRadicalRed: UIColor { return UIColor(.fluorescentRadicalRed) }
    static var maroon: UIColor { return UIColor(.maroon) }
    static var night: UIColor { return UIColor(.night) }
    
}
```

### The Blackboard Way

[ExampleApp](/ExampleApp/Source/FooterViewController.swift#L43)
```swift
view.backgroundColor = .fluorescentMagicMint
```

### The Standard UIKit Way

[StandardApp](/StandardApp/Source/FooterViewController.swift#L43)
```swift
view.backgroundColor = UIColor(named: "Fluorescent/Magic Mint")
```
