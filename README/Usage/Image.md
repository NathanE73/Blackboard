## Image Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

<img src="Images/AutocompleteImage.gif" height="200" alt="Autocomplete Image" />

### Xcode SwiftUI Inspector

<img src="Images/InspectImage.gif" height="300" alt="Inspect Image" />

### Xcode Asset Catalog

![Asset Image Red Stapler](Images/AssetImageRedStapler.png)

### Backboard Generated Code

[ImageAsset.blackboard.swift](/ExampleApp/Source/Generated/ImageAsset.blackboard.swift#L9)

```swift
public enum ImageAsset: String {
    case button
    case greenPaperClip = "green-paper-clip"
    case greenPencil = "green-pencil"
    case redCup = "Red/cup"
    case redStapler = "Red/stapler"
    case silverPaperClip = "silver-paper-clip"
    case whiteDice = "white-dice"
}
```

[Image.blackboard.swift](/ExampleApp/Source/Generated/Image.blackboard.swift#L14)

```swift
@available(iOS 13.0, *)
public extension Image {
    init(asset: ImageAsset)
    init(asset: ImageAsset, label: Text)
    init(decorativeAsset: ImageAsset)
    
    static var button: Image
    static var greenPaperClip: Image
    static var greenPencil: Image
    static var redCup: Image
    static var redStapler: Image
    static var silverPaperClip: Image
    static var whiteDice: Image
}
```

### The Blackboard Way

```swift
Image.redStapler

Image(asset: .redStapler)
Image(asset: .redStapler, label: Text("Red Stapler"))
Image(decorativeAsset: .redStapler)
```

### The Standard SwiftUI Way

```swift
Image("red-stapler")
Image("red-stapler", label: Text("Red Stapler"))
Image(decorative: "red-stapler")
```
