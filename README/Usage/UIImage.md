## UIImage Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

![Autocomplete UIImage](Images/AutocompleteUIImage.gif)

### Xcode Asset Catalog

![Asset Image Red Stapler](Images/AssetImageRedStapler.png)

### Backboard Generated Code

[UIImage.blackboard.swift](/ExampleApp/Source/Generated/UIImage.blackboard.swift)

```swift
extension UIImage {
    static var button: UIImage
    static var greenPaperClip: UIImage
    static var greenPencil: UIImage
    static var redCup: UIImage
    static var redStapler: UIImage
    static var silverPaperClip: UIImage
    static var whiteDice: UIImage
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
