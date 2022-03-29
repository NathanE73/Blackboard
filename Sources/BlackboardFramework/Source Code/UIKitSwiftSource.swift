//
// Copyright (c) 2022 Nathan E. Walczak
//
// MIT License
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Foundation

let UIKitSwiftSource = """
//
//  UIKit.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

extension UICollectionView {
    
    final func dequeueReusableCell<T>(withReuseIdentifier identifier: String, for indexPath: IndexPath, _ initialize: ((_ photoCell: T) -> Void)? = nil) -> T {
        let collectionViewCell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
        initialize?(collectionViewCell)
        return collectionViewCell
    }
    
}

extension UITableView {
    
    final func dequeueReusableCell<T>(withIdentifier identifier: String, for indexPath: IndexPath, _ initialize: ((_ cell: T) -> Void)? = nil) -> T {
        let tableViewCell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
        initialize?(tableViewCell)
        return tableViewCell
    }
    
}

extension UIViewController {
    
    // MARK: - Instantiate
    
    final class func instantiateViewController<T>(from storyboard: UIStoryboard, identifier: String, _ initialize: ((_ viewController: T) -> Void)? = nil) -> T {
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        initialize?(viewController)
        return viewController
    }
    
    final class func instantiateNavigationController<T>(from storyboard: UIStoryboard, identifier: String, _ initialize: ((_ viewController: T) -> Void)? = nil) -> UINavigationController {
        let navigationController = storyboard.instantiateViewController(withIdentifier: identifier) as! UINavigationController
        let viewController = navigationController.viewControllers.first as! T
        initialize?(viewController)
        return navigationController
    }
    
    // MARK: - Perform Segue
    
    class SegueInitialization {
        
        typealias Block = (UIViewController) -> Void
        
        let block: Block
        
        init(block: @escaping Block) {
            self.block = block
        }
        
    }
    
    final func performViewControllerSegue<T: UIViewController>(_ identifier: String, _ initialize: ((T) -> Void)? = nil) {
        var segueInitialization: SegueInitialization?
        if let initialize = initialize {
            segueInitialization = SegueInitialization {
                let viewController = $0 as! T
                initialize(viewController)
            }
        }
        performSegue(withIdentifier: identifier, sender: segueInitialization)
    }
    
    final func performNavigationControllerSegue<T: UIViewController>(_ identifier: String, _ initialize: ((T) -> Void)? = nil) {
        var segueInitialization: SegueInitialization?
        if let initialize = initialize {
            segueInitialization = SegueInitialization {
                let navigationController = $0 as! UINavigationController
                let viewController = navigationController.viewControllers.first as! T
                initialize(viewController)
            }
        }
        performSegue(withIdentifier: identifier, sender: segueInitialization)
    }
    
}

"""
