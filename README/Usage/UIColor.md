## UIColor Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

![Autocomplete UIColor](Images/AutocompleteUIColor.gif)

### Xcode Asset Catalog

![Asset Color Dark Olive Green](Images/AssetColorDarkOliveGreen.png)

### Backboard Generated Code

[UIColor.blackboard.swift](/ExampleApp/Source/Generated/UIColor.blackboard.swift)

```swift
extension UIColor {
    static let absoluteZero: UIColor
    static let bisque: UIColor
    static let charcoal: UIColor
    static let darkOliveGreen: UIColor
    static let desire: UIColor
    static let emerald: UIColor
    static let firebrick: UIColor
    static let fluorescentBlizzardBlue: UIColor
    static let fluorescentMagicMint: UIColor
    static let fluorescentRadicalRed: UIColor
    static let maroon: UIColor
    static let night: UIColor    
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
