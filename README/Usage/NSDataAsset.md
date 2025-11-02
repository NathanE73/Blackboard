## NSDataAsset Usage

Scans through asset catalogs.

### Xcode Editor Autocomplete

![Autocomplete Data](Images/AutocompleteData.png)

### Xcode Asset Catalog

![Asset Data Welcome Message](Images/AssetDataWelcomeMessage.png)

### Backboard Generated Code

[DataAsset.blackboard.swift](/DeclarativeApp/Source/Generated/DataAsset.blackboard.swift#L9)

```swift
public enum DataAsset: String {
    case level001 = "Level/001"
    case level002 = "Level/002"
    case names = "Names"
    case welcomeMessage = "Welcome Message"
}
```

[NSDataAsset.blackboard.swift](/DeclarativeApp/Source/Generated/NSDataAsset.blackboard.swift#L14)

```swift
public extension DataAsset {
    var dataAsset: NSDataAsset
    var data: Data
}

public extension NSDataAsset {
    convenience init(asset: DataAsset)
}

public extension Data {
    init(asset: DataAsset)
}
```

### The Blackboard Way

```swift
let data = Data(asset: .welcomeMessage)
```

### The Standard UIKit Way

```swift
let data = NSDataAsset(name: "Welcome Message")?.data
```
