# Blackboard: Another iOS Storyboard Manager

[![Version](https://img.shields.io/badge/version-6.0.0-brightgreen.svg)]()
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

## Storyboard Usage

### UIStoryboard

[Instantiate Navigation Controller From Storyboard](ExampleApp/Source/AccountsTableViewController.swift#L99)
```swift
@IBAction func presentOpenAccount() {
    let navigationController = OpenAccountViewController.instantiateNavigationControllerFromStoryboard { openAccountViewController in
        openAccountViewController.path = "Instantiate Navigation Controller"
    }
    present(navigationController, animated: true)
}
```

[Instantiate View Controller From Storyboard](ExampleApp/Source/AccountsTableViewController.swift#L106)
```swift
@IBAction func presentOpenAccount() {
    let openAccountViewController = OpenAccountViewController.instantiateFromStoryboard()
    openAccountViewController.path = "Instantiate View Controller"
    
    let navigationController = UINavigationController(rootViewController: openAccountViewController)
    present(navigationController, animated: true)
}
```

### UIStoryboardSegue

[Perform Segue](ExampleApp/Source/AccountsTableViewController.swift#L92)
```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performPresentOpenAccountSegue { openAccountViewController in
        openAccountViewController.path = "Perform Segue"
    }
}
```

[Prepare Segue](ExampleApp/Source/MainViewController.swift#L97)
```swift
func prepareForPresentPhotoSegue(_ photoViewController: PhotoViewController) {
    photoViewController.viewModel = PhotoViewModel.examples.first
}
```

[Should Perform Segue](ExampleApp/Source/MainViewController.swift#L93)
```swift
func shouldPerformPresentPhotoSegue() -> Bool {
    return PhotoViewModel.examples.first != nil
}
```

### UITableViewCell

[Dequeue Cell](ExampleApp/Source/AccountsTableViewController.swift#L73)
```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let accountViewModel = accountViewModels[indexPath.row]
    return dequeueAccountCell(from: tableView, for: indexPath) { cell in
        cell.nameLabel.text = accountViewModel.name
        cell.balanceLabel.text = accountViewModel.balance
    }
}
```

### UICollectionViewCell

[Dequeue Cell](ExampleApp/Source/PhotosCollectionViewController.swift#L37)
```swift
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let photoViewModel = photoViewModels[indexPath.item]
    return dequeuePhotoCell(from: collectionView, for: indexPath) { cell in
        cell.imageView.image = photoViewModel.image
    }
}
```

## Authors

- Nathan Walczak, knate@knate.com
- Jon Shier, jon@jonshier.com

## License

Blackboard is available under the MIT license. See the LICENSE file for more info.
