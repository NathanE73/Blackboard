## Symbol UIImage Usage

### Symbols

![Symbols Chevron Down](Images/SymbolsChevronDown.png)

### Blackboard Configuration

[.blackboard.yml](/.blackboard.yml#L1)

```yml
symbols:
- 14.square.fill
- case
- case.fill
- chevron.down
- chevron.up
- die.face.1
- die.face.4
- infinity.circle.fill
- minus.circle.fill
- person
- person.2
- plus.circle.fill
- return
- repeat
- repeat.circle
```

### Backboard Generated Code

[SymbolAsset.blackboard.swift](/ExampleApp/Source/Generated/SymbolAsset.blackboard.swift#L9)

```swift
@available(iOS 13.0, *)
public enum SymbolAsset: String {
    @available(iOS 14.0, *)
    case caseSymbol = "case"
    @available(iOS 14.0, *)
    case caseSymbolFill = "case.fill"
    case chevronDown = "chevron.down"
    case chevronUp = "chevron.up"
    @available(iOS 14.0, *)
    case dieFace1 = "die.face.1"
    @available(iOS 14.0, *)
    case dieFace4 = "die.face.4"
    @available(iOS 14.2, *)
    case infinityCircleFill = "infinity.circle.fill"
    case minusCircleFill = "minus.circle.fill"
    case number14SquareFill = "14.square.fill"
    case person
    case person2 = "person.2"
    case plusCircleFill = "plus.circle.fill"
    case repeatSymbol = "repeat"
    @available(iOS 14.2, *)
    case repeatSymbolCircle = "repeat.circle"
    case returnSymbol = "return"
}
```

[SymbolUIImage.blackboard.swift](/ExampleApp/Source/Generated/SymbolUIImage.blackboard.swift#L9)

```swift
@available(iOS 13.0, *)
public extension SymbolAsset {
    var image: UIImage?
}

@available(iOS 13.0, *)
public extension UIImage {
    init(symbol: SymbolAsset)
    init(symbol: SymbolAsset, withConfiguration configuration: UIImage.Configuration?)
    init(symbol: SymbolAsset, compatibleWith traitCollection: UITraitCollection?)
    
    @available(iOS 14.0, *)
    static var caseSymbol: UIImage
    @available(iOS 14.0, *)
    static var caseSymbolFill: UIImage
    static var chevronDown: UIImage
    static var chevronUp: UIImage
    @available(iOS 14.0, *)
    static var dieFace1: UIImage
    @available(iOS 14.0, *)
    static var dieFace4: UIImage
    @available(iOS 14.2, *)
    static var infinityCircleFill: UIImage
    static var minusCircleFill: UIImage
    static var number14SquareFill: UIImage
    static var person: UIImage
    static var person2: UIImage
    static var plusCircleFill: UIImage
    static var repeatSymbol: UIImage
    @available(iOS 14.2, *)
    static var repeatSymbolCircle: UIImage
    static var returnSymbol: UIImage    
}
```

### The Blackboard Way

```swift
imageView.image = .chevronDown

imageView.image = UIImage(symbol: .chevronDown)
imageView.image = UIImage(symbol: .chevronDown, withConfiguration: configuration)
imageView.image = UIImage(symbol: .chevronDown, compatibleWith: traitCollection)
```

### The Standard UIKit Way

```swift
imageView.image = UIImage(systemName: "chevron.down")
imageView.image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
imageView.image = UIImage(systemName: "chevron.down", compatibleWith: traitCollection)
```
