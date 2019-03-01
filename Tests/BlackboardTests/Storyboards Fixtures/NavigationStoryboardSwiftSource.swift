//
// Copyright (c) 2019 Nathan E. Walczak
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

let NavigationStoryboardSwiftSource = """
//
//  NavigationStoryboardExtensions.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

private let sharedStoryboardInstance = UIStoryboard(name: "Navigation", bundle: nil)

private class InitializeBlockObject {
    
    let block: ((UIViewController) -> Void)
    
    init(block: @escaping ((UIViewController) -> Void)) {
        self.block = block
    }
    
}

extension MenuViewController {
    
    final class func instantiateViewControllerFromStoryboard(_ initialize: ((_ menuViewController: MenuViewController) -> Void)? = nil) -> MenuViewController {
        let viewController = sharedStoryboardInstance.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        initialize?(viewController)
        return viewController
    }
    
    final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ menuViewController: MenuViewController) -> Void)? = nil) -> UINavigationController {
        let navigationController = sharedStoryboardInstance.instantiateViewController(withIdentifier: "MenuNavigationController") as! UINavigationController
        let viewController = navigationController.viewControllers.first as! MenuViewController
        initialize?(viewController)
        return navigationController
    }
    
    // Segues
    
    func handleSegue(_ segue: UIStoryboardSegue, sender: Any?) {
        if let initializeBlockObject = sender as? InitializeBlockObject {
            initializeBlockObject.block(segue.destination)
        }
    }
    
}

extension WelcomeViewController {
    
    final class func instantiateViewControllerFromStoryboard(_ initialize: ((_ welcomeViewController: WelcomeViewController) -> Void)? = nil) -> WelcomeViewController {
        let viewController = sharedStoryboardInstance.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        initialize?(viewController)
        return viewController
    }
    
    final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ welcomeViewController: WelcomeViewController) -> Void)? = nil) -> UINavigationController {
        let navigationController = sharedStoryboardInstance.instantiateViewController(withIdentifier: "WelcomeNavigationController") as! UINavigationController
        let viewController = navigationController.viewControllers.first as! WelcomeViewController
        initialize?(viewController)
        return navigationController
    }
    
    // Segues
    
    enum SegueIdentifier: String {
        case showMenu = "ShowMenu"
    }
    
    func handleSegue(_ segue: UIStoryboardSegue, sender: Any?) {
        if let initializeBlockObject = sender as? InitializeBlockObject {
            initializeBlockObject.block(segue.destination)
        }
    }
    
    final func performShowMenuSegue(_ initialize: @escaping ((MenuViewController) -> Void) = {_ in}) {
        let initializeBlock = InitializeBlockObject() {
            let navigationController = $0 as! UINavigationController
            let viewController = navigationController.viewControllers.first as! MenuViewController
            initialize(viewController)
        }
        performSegue(withIdentifier: SegueIdentifier.showMenu.rawValue, sender: initializeBlock)
    }
    
}

"""
