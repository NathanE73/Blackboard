## Symbol UIImage Usage

### Symbols

![Symbols Chevron Down](Images/SymbolsChevronDown.png)

### Blackboard Configuration

[.blackboard.yml](/.blackboard.yml#L1)

```yml
symbols:
- a.book.closed
- 14.square.fill
- case
- case.fill
- character.book.closed
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

[SymbolAsset.blackboard.swift](/DeclarativeApp/Source/Generated/SymbolAsset.blackboard.swift#L9)

```swift
public enum SymbolAsset: String {
    @available(iOS, introduced: 14.0, deprecated: 14.2, renamed: "characterBookClosed")
    case aBookClosed = "a.book.closed"
    @available(iOS 14.0, *)
    case `case`
    @available(iOS 14.0, *)
    case caseFill = "case.fill"
    @available(iOS 14.2, *)
    case characterBookClosed = "character.book.closed"
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
    case `repeat`
    @available(iOS 14.2, *)
    case repeatCircle = "repeat.circle"
    case `return`
```

[SymbolUIImage.blackboard.swift](/DeclarativeApp/Source/Generated/SymbolUIImage.blackboard.swift#L9)

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
    
    @available(iOS, introduced: 14.0, deprecated: 14.2, renamed: "symbolCharacterBookClosed")
    static var symbolABookClosed: UIImage
    @available(iOS 14.0, *)
    static var symbolCase: UIImage
    @available(iOS 14.0, *)
    static var symbolCaseFill: UIImage
    @available(iOS 14.2, *)
    static var symbolCharacterBookClosed: UIImage
    static var symbolChevronDown: UIImage
    static var symbolChevronUp: UIImage
    @available(iOS 14.0, *)
    static var symbolDieFace1: UIImage
    @available(iOS 14.0, *)
    static var symbolDieFace4: UIImage
    @available(iOS 14.2, *)
    static var symbolInfinityCircleFill: UIImage
    static var symbolMinusCircleFill: UIImage
    static var symbolNumber14SquareFill: UIImage
    static var symbolPerson: UIImage
    static var symbolPerson2: UIImage
    static var symbolPlusCircleFill: UIImage
    static var symbolRepeat: UIImage
    @available(iOS 14.2, *)
    static var symbolRepeatCircle: UIImage
    static var symbolReturn: UIImage
}
```

### The Blackboard Way

```swift
imageView.image = .symbolChevronDown

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
