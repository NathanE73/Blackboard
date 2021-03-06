## Should Perform Segue Usage

Scans through storyboards.

### Xcode Editor Autocomplete

![Autocomplete Should Perform Segue](Images/AutocompleteShouldPerformSegue.png)

### Backboard Generated Code

[MainStoryboard.blackboard.swift](/ExampleApp/Source/Generated/MainStoryboard.blackboard.swift)

```swift
func shouldPerformPresentPhotoSegue() -> Bool
```

### The Blackboard Way

[ExampleApp](/ExampleApp/Source/MainViewController.swift#L93)
```swift
func shouldPerformPresentPhotoSegue() -> Bool {
    return PhotoViewModel.examples.first != nil
}
```

### The Standard UIKit Way

[StandardApp](/StandardApp/Source/MainViewController.swift#L69)
```swift
override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    if identifier == "Present Photo" {
        return PhotoViewModel.examples.first != nil
    }
    return true
}
```
