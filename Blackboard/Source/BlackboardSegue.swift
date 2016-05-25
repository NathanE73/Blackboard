//
// Copyright (c) 2016 Nathan E. Walczak
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

struct BlackboardSegue {
    
    let name: String
    let identifier: String
    let viewControllerClassName: String
    let navigationControllerClassName: String?
    
}

extension BlackboardSegue {
    
    init?(segue: StoryboardSegue, storyboard: Storyboard) {
        guard let identifier = segue.identifier else {
            return nil
        }
        
        name = identifier
        self.identifier = identifier
        
        guard let destinationViewController = storyboard.viewControllerWith(id: segue.destination) else {
            return nil
        }
        let destinationCustomClass = destinationViewController.customClass ?? destinationViewController.type.className
        
        if destinationViewController.type == .NavigationController {
            guard let rootViewControllerSegue = destinationViewController.segueWith(kind: .Relationship) else {
                return nil
            }
            guard let rootViewController = storyboard.viewControllerWith(id: rootViewControllerSegue.destination) else {
                return nil
            }
            viewControllerClassName = rootViewController.customClass ?? rootViewController.type.className
            navigationControllerClassName = destinationCustomClass
        }
        else {
            viewControllerClassName = destinationCustomClass
            navigationControllerClassName = nil
        }
    }
    
}

extension SwiftSource {
    
    func appendInitializeBlockObject() {
        append("private class InitializeBlockObject") {
            append()
            append("let block: (UIViewController -> Void)")
            append()
            append("init(block: (UIViewController -> Void))") {
                append("self.block = block")
            }
            append()
        }
        append()
    }
    
    func appendSegues(segues: [BlackboardSegue]) {
        append("// Segues")
        append()
        appendSegueIdentifierFor(segues)
        appendHandleSegue()
        appendPerformSegueFor(segues)
        append()
    }
    
    func appendSegueIdentifierFor(segues: [BlackboardSegue]) {
        guard !segues.isEmpty else { return }
        
        append("enum SegueIdentifier: String") {
            segues.forEach { segue in
                append("case \(segue.name) = \"\(segue.identifier)\"")
            }
        }
        append()
    }
    
    func appendHandleSegue() {
        append("func handleSegue(segue: UIStoryboardSegue, sender: AnyObject?)") {
            append("if let initializeBlockObject = sender as? InitializeBlockObject") {
                append("initializeBlockObject.block(segue.destinationViewController)")
            }
        }
        append()
    }
    
    func appendPerformSegueFor(segues: [BlackboardSegue]) {
        guard !segues.isEmpty else { return }
        
        segues.forEach { segue in
            append("final func perform\(segue.name)Segue(initialize: ((\(segue.viewControllerClassName)) -> Void)? = nil)") {
                append("let initializeBlock = initialize == nil ? nil : InitializeBlockObject()") {
                    if let navigationControllerClassName = segue.navigationControllerClassName {
                        append("let navigationController = $0 as! \(navigationControllerClassName)")
                        append("let viewController = navigationController.viewControllers.first as! \(segue.viewControllerClassName)")
                        append("initialize(viewController)")
                    }
                    else {
                        append("initialize($0 as! \(segue.viewControllerClassName))")
                    }
                }
                append("performSegueWithIdentifier(SegueIdentifier.\(segue.name).rawValue, sender: initializeBlock)")
            }
            append()
        }
    }
    
}
