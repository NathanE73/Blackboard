# Blackboard: Another iOS Storyboard Manager

[![Version](https://img.shields.io/badge/version-6.2.0-brightgreen.svg)]()
[![License](https://img.shields.io/badge/license-MIT-222222.svg)](http://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/swift-4.2-yellow.svg)](https://swift.org)
[![Sponsor](https://img.shields.io/badge/Sponsor-Detroit%20Labs-000000.svg)](http://www.detroitlabs.com/)

## Purpose

Blackboard is an iOS Storyboard and Asset Manager written in Swift.

## Requirements

- iOS 10.0+
- Xcode 10.0+

## Installation

- [CocoaPods](/README/Installation/CocoaPods.md)
- [Manually](/README/Installation/Manually.md)

## Usage

The `ExampleApp` project uses Blackboard.
The `StandardApp` project is the same as the `ExampleApp` project, except that it does not use Blackboard.
You compare these to see the difference between using and not using Blackboard.

- Asset Usage
  - [UIColor](/README/Usage/UIColor.md)
  - [CGColor](/README/Usage/CGColor.md)
  - [UIImage](/README/Usage/UIImage.md)
- Storyboard Usage
  - Cells
    - [Dequeue Collection View Cell](/README/Usage/UICollectionViewCell.md)
    - [Dequeue Table View Cell](/README/Usage/UITableViewCell.md)
  - Controllers
    - [Instantiate Navigation Controller](/README/Usage/UINavigationController.md)
    - [Instantiate View Controller](/README/Usage/UIViewController.md)
  - Segues
    - [Perform Segue](/README/Usage/UIStoryboardSeguePerform.md)
    - [Prepare Segue](/README/Usage/UIStoryboardSeguePrepare.md)
    - [Should Perform Segue](/README/Usage/UIStoryboardSegueShouldPerform.md)

## Authors

- Nathan Walczak, knate@knate.com
- Jon Shier, jon@jonshier.com

## License

Blackboard is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
