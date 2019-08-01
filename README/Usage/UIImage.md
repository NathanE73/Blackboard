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
    var image: UIImage { return UIImage(self) }
}

public extension UIImage {
    
    convenience init(_ imageAsset: ImageAsset, compatibleWith traitCollection: UITraitCollection? = nil) {
        self.init(named: imageAsset.rawValue, in: bundle, compatibleWith: traitCollection)!
    }
    
    static var button: UIImage { return UIImage(ImageAsset.button) }
    static var greenPaperClip: UIImage { return UIImage(ImageAsset.greenPaperClip) }
    static var greenPencil: UIImage { return UIImage(ImageAsset.greenPencil) }
    static var redCup: UIImage { return UIImage(ImageAsset.redCup) }
    static var redStapler: UIImage { return UIImage(ImageAsset.redStapler) }
    static var silverPaperClip: UIImage { return UIImage(ImageAsset.silverPaperClip) }
    static var whiteDice: UIImage { return UIImage(ImageAsset.whiteDice) }
    
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
