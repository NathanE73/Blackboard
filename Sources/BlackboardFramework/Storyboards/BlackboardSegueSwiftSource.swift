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

extension SwiftSource {
    
    func appendSegues(_ viewController: BlackboardViewController) {
        let segues = viewController.segues
        let shouldPerformSegues = viewController.shouldPerformSegues
        
        guard segues.isEmpty == false else { return }
        
        append("// Segues")
        append()
        appendSegueIdentifierFor(segues)
        appendPrepareForSegue(segues)
        appendShouldPerformSegue(shouldPerformSegues)
        appendPerformSegueFor(segues)
        append()
    }
    
    func appendSegueIdentifierFor(_ segues: [BlackboardSegue]) {
        append("enum SegueIdentifier: String") {
            segues.forEach { segue in
                append("case \(segue.enumName) = \"\(segue.identifier)\"")
            }
        }
        append()
    }
    
    func appendPrepareForSegue(_ segues: [BlackboardSegue]) {
        append("final override func prepare(for segue: UIStoryboardSegue, sender: Any?)") {
            guard !segues.isEmpty else { return }
            
            append("if let segueInitialization = sender as? SegueInitialization") {
                append("segueInitialization.block(segue.destination)")
                append("return")
            }
            append()
            
            append("guard let identifier = segue.identifier else") {
                append("return")
            }
            append()
            
            append("switch SegueIdentifier(rawValue: identifier) {")
            segues.forEach(appendPrepareForSegue)
            append("case .none:")
            indent {
                append("break")
            }
            append("}")
        }
        append()
    }
    
    func appendPrepareForSegue(_ segue: BlackboardSegue) {
        append("case .\(segue.enumName)?:")
        indent {
            if let navigationControllerClassName = segue.navigationControllerClassName {
                append("let navigationController = segue.destination as! \(navigationControllerClassName)")
                append("let viewController = navigationController.viewControllers.first as! \(segue.viewControllerClassName)")
            } else {
                append("let viewController = segue.destination as! \(segue.viewControllerClassName)")
            }
            append("\(segue.prepareFuncName)(viewController)")
        }
    }
    
    func appendShouldPerformSegue(_ segues: [BlackboardSegue]) {
        guard segues.isEmpty == false else { return }
        
        append("final override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool") {
            append("switch SegueIdentifier(rawValue: identifier) {")
            segues.forEach(appendShouldPerformSegue)
            append("default:")
            indent {
                append("return true")
            }
            append("}")
        }
        append()
    }
    
    func appendShouldPerformSegue(_ segue: BlackboardSegue) {
        guard let shouldPerformFuncName = segue.shouldPerformFuncName else { return }
        
        append("case .\(segue.enumName)?:")
        indent {
            append("return \(shouldPerformFuncName)()")
        }
    }
    
    func appendPerformSegueFor(_ segues: [BlackboardSegue]) {
        segues.forEach(appendPerformSequeFor)
    }
    
    func appendPerformSequeFor(_ segue: BlackboardSegue) {
        append("final func \(segue.performFuncName)(_ initialize: ((\(segue.viewControllerClassName)) -> Void)? = nil)") {
            if segue.navigationControllerClassName != nil {
                append("performNavigationControllerSegue(SegueIdentifier.\(segue.enumName).rawValue, initialize)")
            } else {
                append("performViewControllerSegue(SegueIdentifier.\(segue.enumName).rawValue, initialize)")
            }
        }
        append()
    }
    
}
