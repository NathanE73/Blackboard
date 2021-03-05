## Symbol Image Usage

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
    case caseFill = "case.fill"
    @available(iOS 14.0, *)
    case caseSymbol = "case"
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
    @available(iOS 14.2, *)
    case repeatCircle = "repeat.circle"
    case repeatSymbol = "repeat"
    case returnSymbol = "return"
}
```

[SymbolImage.blackboard.swift](/ExampleApp/Source/Generated/SymbolImage.blackboard.swift#L9)

```swift
@available(iOS 13.0, *)
public extension Image {
    init(symbol: SymbolAsset)
    
    @available(iOS 14.0, *)
    static var symbolCase: Image
    @available(iOS 14.0, *)
    static var symbolCaseFill: Image
    static var symbolChevronDown: Image
    static var symbolChevronUp: Image
    @available(iOS 14.0, *)
    static var symbolDieFace1: Image
    @available(iOS 14.0, *)
    static var symbolDieFace4: Image
    @available(iOS 14.2, *)
    static var symbolInfinityCircleFill: Image
    static var symbolMinusCircleFill: Image
    static var symbolNumber14SquareFill: Image
    static var symbolPerson: Image
    static var symbolPerson2: Image
    static var symbolPlusCircleFill: Image
    static var symbolRepeat: Image
    @available(iOS 14.2, *)
    static var symbolRepeatCircle: Image
    static var symbolReturn: Image
}
```

### The Blackboard Way

```swift
Image.symbolChevronDown

Image(symbol: .chevronDown)
```

### The Standard SwiftUI Way

```swift
Image(systemName: "chevron.down")
```
