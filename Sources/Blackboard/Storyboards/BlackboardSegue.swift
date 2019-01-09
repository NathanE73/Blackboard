//
// Copyright (c) 2018 Nathan E. Walczak
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
    let enumName: String
    let identifier: String
    let viewControllerClassName: String?
    let navigationControllerClassName: String?
    
}

extension BlackboardSegue {
    
    init?(segue: StoryboardSegue, storyboard: Storyboard, storyboards: [Storyboard]) {
        guard let identifier = segue.identifier else {
            return nil
        }
        
        self.name = identifier
        
        self.enumName = name.firstCharacterLowercased
        
        self.identifier = identifier
        
        var storyboard = storyboard
        
        var destinationViewController = storyboard.viewControllerWith(id: segue.destination)
        
        if let storyboardName = destinationViewController?.storyboardName {
            storyboard = storyboards.first(withName: storyboardName) ?? storyboard
            destinationViewController = storyboard.initialViewController
        }
        
        let destinationCustomClass = destinationViewController?.customClass ?? destinationViewController?.type.className
        
        if destinationViewController?.type == .navigationController {
            guard let rootViewControllerSegue = destinationViewController?.segueWith(kind: .relationship) else {
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
            append("let block: ((UIViewController) -> Void)")
            append()
            append("init(block: @escaping ((UIViewController) -> Void))") {
                append("self.block = block")
            }
            append()
        }
        append()
    }
    
    func appendSegues(_ segues: [BlackboardSegue]) {
        append("// Segues")
        append()
        appendSegueIdentifierFor(segues)
        appendHandleSegue()
        appendPerformSegueFor(segues)
        append()
    }
    
    func appendSegueIdentifierFor(_ segues: [BlackboardSegue]) {
        guard segues.isEmpty == false else { return }
        
        append("enum SegueIdentifier: String") {
            segues.forEach { segue in
                append("case \(segue.enumName) = \"\(segue.identifier)\"")
            }
        }
        append()
    }
    
    func appendHandleSegue() {
        append("func handleSegue(_ segue: UIStoryboardSegue, sender: Any?)") {
            append("if let initializeBlockObject = sender as? InitializeBlockObject") {
                append("initializeBlockObject.block(segue.destination)")
            }
        }
        append()
    }
    
    func appendPerformSegueFor(_ segues: [BlackboardSegue]) {
        guard segues.isEmpty == false else { return }
        
        segues.forEach { segue in
            if let viewControllerClassName = segue.viewControllerClassName {
                appendPerformSequeFor(segue, viewControllerClassName: viewControllerClassName)
            }
            else {
                appendPerformSequeFor(segue)
            }
            append()
        }
    }
    
    func appendPerformSequeFor(_ segue: BlackboardSegue, viewControllerClassName: String) {
        append("final func perform\(segue.name)Segue(_ initialize: @escaping ((\(viewControllerClassName)) -> Void) = {_ in})") {
            append("let initializeBlock = InitializeBlockObject()") {
                if let navigationControllerClassName = segue.navigationControllerClassName {
                    append("let navigationController = $0 as! \(navigationControllerClassName)")
                    append("let viewController = navigationController.viewControllers.first as! \(viewControllerClassName)")
                    append("initialize(viewController)")
                }
                else {
                    append("initialize($0 as! \(viewControllerClassName))")
                }
            }
            append("performSegue(withIdentifier: SegueIdentifier.\(segue.enumName).rawValue, sender: initializeBlock)")
        }
    }
    
    func appendPerformSequeFor(_ segue: BlackboardSegue) {
        append("final func perform\(segue.name)Segue()") {
            append("performSegue(withIdentifier: SegueIdentifier.\(segue.enumName).rawValue, sender: nil)")
        }
    }
    
}
