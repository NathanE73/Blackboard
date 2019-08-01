## UIImage Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

![Autocomplete UIImage](Images/AutocompleteUIImage.gif)

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

[UIImage.blackboard.swift](/ExampleApp/Source/Generated/UIImage.blackboard.swift)

```swift
public extension ImageAsset {
    var image: UIImage { return UIImage(asset: self) }
}

public extension UIImage {
    
    convenience init(asset imageAsset: ImageAsset, compatibleWith traitCollection: UITraitCollection? = nil) {
        self.init(named: imageAsset.rawValue, in: bundle, compatibleWith: traitCollection)!
    }
    
    static var button: UIImage { return UIImage(asset: ImageAsset.button) }
    static var greenPaperClip: UIImage { return UIImage(asset: ImageAsset.greenPaperClip) }
    static var greenPencil: UIImage { return UIImage(asset: ImageAsset.greenPencil) }
    static var redCup: UIImage { return UIImage(asset: ImageAsset.redCup) }
    static var redStapler: UIImage { return UIImage(asset: ImageAsset.redStapler) }
    static var silverPaperClip: UIImage { return UIImage(asset: ImageAsset.silverPaperClip) }
    static var whiteDice: UIImage { return UIImage(asset: ImageAsset.whiteDice) }
    
}
```

### The Blackboard Way

```swift
imageView.image = .redStapler
```

### The Standard UIKit Way

```swift
imageView.image = UIImage(named: "red-stapler")
```
