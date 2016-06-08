# Blackboard: Another iOS Storyboard Manager

[![Version](https://img.shields.io/badge/version-0.9.2-brightgreen.svg)]()
[![License](https://img.shields.io/badge/license-MIT-222222.svg)](http://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/swift-2.2-yellow.svg)](https://swift.org)

## Requirements

- iOS 8.0+
- Xcode 7.3+

## Installation

### Downloading

```bash
$ curl https://raw.githubusercontent.com/NathanE73/Blackboard/master/bin/blackboard > blackboard
```

### Making It Executable

```bash
$ chmod +x blackboard
```

## Usage - Command Line

### Identify Version

See which version of `blackboard` currently have:

```bash
$ bin/blackboard --version
Blackboard Version 0.9.2
```

### Generating Source

```bash
$ bin/blackboard ExampleApp/Resources/ ExampleApp/Source/Generated/
```

## Usage - Generated Source

### UIViewController

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    window?.rootViewController = WelcomeViewController.instantiateViewControllerFromStoryboard()
    
    window?.makeKeyAndVisible()
    
    return true
}
```

### UINavigationController

```swift
let namesNavigationController = NamesViewController.instantiateNavigationControllerFromStoryboard { (namesViewController) in
    namesViewController.names = ["Steve Dave", "John Doe"]
}
presentViewController(namesNavigationController, animated: true, completion: nil)
```

### UIStoryboardSegue

```swift
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performShowNameSegue { (nameViewController) in
        nameViewController.name = self.names[indexPath.row]
    }
}
```

### UITableViewCell

```swift
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return dequeueNameCellFrom(tableView, forIndexPath: indexPath) { (nameCell) in
        nameCell.name = names[indexPath.row]
    }
}
```

### UICollectionViewCell

```swift
let cell = dequeueAccountNameCellFrom(collectionView) { (accountNameCell) in
    accountNameCell.name = "Steve Dave"
}
```

## Author

Nathan Walczak, knate@knate.com

## License

Blackboard is available under the MIT license. See the LICENSE file for more info.
