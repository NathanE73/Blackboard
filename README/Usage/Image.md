## Image Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

![Autocomplete Image](Images/AutocompleteImage.gif)

### Xcode Asset Catalog

![Asset Image Red Stapler](Images/AssetImageRedStapler.png)

### Backboard Generated Code

[ImageAsset.blackboard.swift](/ExampleApp/Source/Generated/ImageAsset.blackboard.swift)

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

[Image.blackboard.swift](/ExampleApp/Source/Generated/Image.blackboard.swift)

```swift
public extension Image {
    
    init(_ imageAsset: ImageAsset) {
        self.init(imageAsset.rawValue, bundle: bundle)
    }
    
    init(_ imageAsset: ImageAsset, label: Text) {
        self.init(imageAsset.rawValue, bundle: bundle, label: label)
    }
    
    init(decorative imageAsset: ImageAsset) {
        self.init(decorative: imageAsset.rawValue, bundle: bundle)
    }
    
}
```

### The Blackboard Way

```swift
Image(.redStapler)
Image(.redStapler, label: Text("Red Stapler"))
Image(decorative: .redStapler)
```

### The Standard SwiftUI Way

```swift
Image("red-stapler")
Image("red-stapler", label: Text("Red Stapler"))
Image(decorative: "red-stapler")
```
