## Color Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

<img src="Images/AutocompleteColor.gif" height="200" alt="Autocomplete Color" />

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

[Color.blackboard.swift](/ExampleApp/Source/Generated/Color.blackboard.swift)

```swift
public extension Color {
    
    init(asset colorAsset: ColorAsset) {
        self.init(colorAsset.rawValue, bundle: bundle)
    }
    
    static var absoluteZero: Color { return Color(asset: ColorAsset.absoluteZero) }
    static var bisque: Color { return Color(asset: ColorAsset.bisque) }
    static var charcoal: Color { return Color(asset: ColorAsset.charcoal) }
    static var darkOliveGreen: Color { return Color(asset: ColorAsset.darkOliveGreen) }
    static var desire: Color { return Color(asset: ColorAsset.desire) }
    static var emerald: Color { return Color(asset: ColorAsset.emerald) }
    static var empty: Color { return Color(asset: ColorAsset.empty) }
    static var firebrick: Color { return Color(asset: ColorAsset.firebrick) }
    static var fluorescentBlizzardBlue: Color { return Color(asset: ColorAsset.fluorescentBlizzardBlue) }
    static var fluorescentMagicMint: Color { return Color(asset: ColorAsset.fluorescentMagicMint) }
    static var fluorescentRadicalRed: Color { return Color(asset: ColorAsset.fluorescentRadicalRed) }
    static var maroon: Color { return Color(asset: ColorAsset.maroon) }
    static var night: Color { return Color(asset: ColorAsset.night) }
    
}
```

### The Blackboard Way

```swift
Color(asset: .darkOliveGreen)
Color(asset: .fluorescentMagicMint)
```

### The Standard SwiftUI Way

```swift
Color(named: "dark-olive-green")
Color(named: "Fluorescent/Magic Mint")
```
