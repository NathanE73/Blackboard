# Blackboard: Another iOS Storyboard Manager

[![Version](https://img.shields.io/badge/version-5.1.0-brightgreen.svg)]()
[![License](https://img.shields.io/badge/license-MIT-222222.svg)](http://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/swift-4.2-yellow.svg)](https://swift.org)
[![Sponsor](https://img.shields.io/badge/Sponsor-Detroit%20Labs-000000.svg)](http://www.detroitlabs.com/)

## Requirements

- iOS 10.0+
- Xcode 10.0+

## Installation

### Using [CocoaPods](https://cocoapods.org):

Simply add the following line to your Podfile:

```ruby
pod 'Blackboard'
```

This will download the Blackboard binaries and dependencies in `Pods/` during your next
`pod install` execution and will allow you to invoke it via `${PODS_ROOT}/Blackboard/blackboard`
in your Script Build Phases.

This is the recommended way to install a specific version of Blackboard since it supports
installing a pinned version rather than simply the latest.

Note that this will add the Blackboard binaries, its dependencies' binaries and the Swift binary
library distribution to the `Pods/` directory, so checking in this directory to SCM such as
git is discouraged.

### Xcode

Integrate Blackboard into an Xcode scheme to get warnings and errors displayed
in the IDE. Just add a new "Run Script Phase" with:

```bash
if which "${PODS_ROOT}/Blackboard/blackboard" >/dev/null; then
  "${PODS_ROOT}/Blackboard/blackboard" "ExampleApp/Resources/" "ExampleApp/Source/Generated/"
else
  echo "warning: blackboard not installed, download from https://github.com/NathanE73/Blackboard"
fi
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

- Nathan Walczak, knate@knate.com
- Jon Shier, jon@jonshier.com

## License

Blackboard is available under the MIT license. See the LICENSE file for more info.
