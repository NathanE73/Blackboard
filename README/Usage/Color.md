## Color Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

![Autocomplete Color](Images/AutocompleteColor.gif)

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
    
    init(_ colorAsset: ColorAsset) {
        self.init(colorAsset.rawValue, bundle: bundle)
    }
    
    static var absoluteZero: Color { return Color(.absoluteZero) }
    static var bisque: Color { return Color(.bisque) }
    static var charcoal: Color { return Color(.charcoal) }
    static var darkOliveGreen: Color { return Color(.darkOliveGreen) }
    static var desire: Color { return Color(.desire) }
    static var emerald: Color { return Color(.emerald) }
    static var empty: Color { return Color(.empty) }
    static var firebrick: Color { return Color(.firebrick) }
    static var fluorescentBlizzardBlue: Color { return Color(.fluorescentBlizzardBlue) }
    static var fluorescentMagicMint: Color { return Color(.fluorescentMagicMint) }
    static var fluorescentRadicalRed: Color { return Color(.fluorescentRadicalRed) }
    static var maroon: Color { return Color(.maroon) }
    static var night: Color { return Color(.night) }
    
}
```

### The Blackboard Way

```swift
Color(.darkOliveGreen)
Color(.fluorescentMagicMint)
```

### The Standard SwiftUI Way

```swift
Color(named: "dark-olive-green")
Color(named: "Fluorescent/Magic Mint")
```
