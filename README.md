# Blackboard: Another iOS Storyboard Manager

[![Version](https://img.shields.io/badge/version-4.2.0-brightgreen.svg)]()
[![License](https://img.shields.io/badge/license-MIT-222222.svg)](http://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/swift-4.1-yellow.svg)](https://swift.org)
[![Sponsor](https://img.shields.io/badge/Sponsor-Detroit%20Labs-000000.svg)](http://www.detroitlabs.com/)

## Requirements

- iOS 8.0+
- Xcode 8.0+

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
Blackboard Version 4.2.0
```

### Generating Source

```bash
$ bin/blackboard ExampleApp/Resources/ ExampleApp/Source/Generated/
```
```bash
$ bin/blackboard BlackboardTests/Resources/ BlackboardTests/Resources/GeneratedSource/
```

## Usage - Generated Source

### UIViewController

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    
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
present(namesNavigationController, animated: true, completion: nil)
```

### UIStoryboardSegue

```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performShowNameSegue { (nameViewController) in
        nameViewController.name = self.names[indexPath.row]
    }
}
```

### UITableViewCell

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return dequeueNameCell(from: tableView, for: indexPath) { (nameCell) in
        nameCell.name = self.names[indexPath.row]
    }
}
```

### UICollectionViewCell

```swift
let cell = dequeueAccountNameCell(from: collectionView) { (accountNameCell) in
    accountNameCell.name = "Steve Dave"
}
```

## Authors

* Nathan Walczak, knate@knate.com
* Jon Shier, jon@jonshier.com

## License

Blackboard is available under the MIT license. See the LICENSE file for more info.
