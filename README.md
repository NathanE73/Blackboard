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

## Usage

### UIViewController

```swift
let viewController = WelcomeViewController.instantiateViewControllerFromStoryboard { (welcomeViewController) in
    welcomeViewController.welcomeMessage = "Hello, World!"
}
```

### UINavigationController

```swift
let navigationController = WelcomeViewController.instantiateNavigationControllerFromStoryboard { (welcomeViewController) in
    welcomeViewController.welcomeMessage = "Hello, World!"
}
```

### UIStoryboardSegue

```swift
performShowAccountDetailsSegue { (accountDetailsViewController) in
    accountDetailsViewController.account = account
}
```

### UITableViewCell

```swift
let cell = dequeueAccountNameCellFrom(tableView) { (accountNameCell) in
    accountNameCell.name = "Steve Dave"
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
