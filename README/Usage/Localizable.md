## Localizable Usage

Scans through strings files.

### Backboard Generated Code

[Localizable.blackboard.swift](/ExampleApp/Source/Generated/Localizable.blackboard.swift#L14)

```swift
public enum Localizable: String {
    
    /// English: Checking
    case accountTypeChecking = "account-type-checking"
    
    /// English: Roth IRA
    case accountTypeRoth = "account-type-roth"
    
    /// English: Savings
    case accountTypeSavings = "account-type-savings"
    
    /// English: Number of cookies: %d
    case cookieCount = "COOKIE_COUNT"
    
    /// English: Days since last injury: %@
    case daysSinceLastInjury = "Days since last injury: %@"
    
    /// English: Greetings, %@ %@!
    case greetings
    
    /// English: Seven
    case number7 = "7"
    
    /// English: 100%%
    case oneHundredPercent = "one_hundred_percent"
    
    /// English: Button
    case photoButton
    
    /// English: Green Paper Clip
    case photoGreenPaperClip
    
    /// English: Green Pencil
    case photoGreenPencil
    
    /// English: Red Cup
    case photoRedCup
    
    /// English: Silver Paper Clip
    case photoSilverPaperClip
    
    /// English: Stapler
    case photoStapler
    
    /// English: White Dice
    case photoWhiteDice
    
    /// English: Will it rain today?
    case willItRainToday = "Will it rain today?"
    
    var localizedString: String
    
    func localizedString(arguments: CVarArg...) -> String
    
}
```
