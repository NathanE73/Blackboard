# Blackboard: An iOS Storyboard and Asset Manager

[![Version](https://img.shields.io/badge/version-8.0.0-brightgreen.svg)]()
[![License](https://img.shields.io/badge/license-MIT-222222.svg)](http://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/swift-4.2-yellow.svg)](https://swift.org)
[![Swift](https://img.shields.io/badge/swift-5.0-yellow.svg)](https://swift.org)
[![Sponsor](https://img.shields.io/badge/Sponsor-Detroit%20Labs-000000.svg)](http://www.detroitlabs.com/)

## Purpose

Blackboard is an iOS Storyboard and Asset Manager written in Swift.

## Requirements

- iOS 11.0+
- Xcode 10.0+

## Installation

- [Mint](/README/Installation/Mint.md#installation)
- [SwiftLint](/README/Installation/SwiftLint.md#installation)
- [CocoaPods](/README/Installation/CocoaPods.md#installation)
- [Manually](/README/Installation/Manually.md#installation)

## Usage

The `DeclarativeApp` project uses Blackboard using `SwiftUI`.

The `ExampleApp` project uses Blackboard using `UIKit`.
The `StandardApp` project is the same as the `ExampleApp` project, except that it does not use Blackboard.
You compare these to see the difference between using and not using Blackboard.

- Asset Usage
  - CoreGraphics
    - [CGColor](/README/Usage/CGColor.md#cgcolor-usage)
  - SwiftUI
    - [Color](/README/Usage/Color.md#color-usage)
    - [Image](/README/Usage/Image.md#image-usage)
  - UIKit
    - [NSDataAsset](/README/Usage/NSDataAsset.md#nsdataasset-usage)
    - [UIColor](/README/Usage/UIColor.md#uicolor-usage)
    - [UIImage](/README/Usage/UIImage.md#uiimage-usage)
- Storyboard Usage
  - Cells
    - [Dequeue Collection View Cell](/README/Usage/UICollectionViewCell.md#dequeue-collection-view-cell-usage)
    - [Dequeue Table View Cell](/README/Usage/UITableViewCell.md#dequeue-table-view-cell-usage)
  - Controllers
    - [Instantiate Navigation Controller](/README/Usage/UINavigationController.md#instantiate-navigation-controller-usage)
    - [Instantiate View Controller](/README/Usage/UIViewController.md#instantiate-view-controller-usage)
  - Segues
    - [Perform Segue](/README/Usage/UIStoryboardSeguePerform.md#perform-segue-usage)
    - [Prepare Segue](/README/Usage/UIStoryboardSeguePrepare.md#prepare-segue-usage)
    - [Should Perform Segue](/README/Usage/UIStoryboardSegueShouldPerform.md#should-perform-segue-usage)

## Storyboard Resources Validation

Blackboard will also verify that the resources referenced in each processed storyboard exist.
When a storyboard is referencing a color or image that is no longer available,
one of the two following warning messages will be generate:

### Missing Named Color
![Missing Named Color Warning](README/Images/WarningMissingNamedColor.png)

### Missing Named Image
![Missing Named Image Warning](README/Images/WarningMissingNamedImage.png)

## Authors

- Nathan E. Walczak, knate@knate.com
- Jon Shier, jon@jonshier.com

## License

Blackboard is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
