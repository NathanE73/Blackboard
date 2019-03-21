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
    
    func appendSegueInitialization() {
        append("private class SegueInitialization") {
            append()
            append("typealias Block = (UIViewController) -> Void")
            append()
            append("let block: Block")
            append()
            append("init(block: @escaping Block)") {
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
        appendPrepareForSegue(segues)
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
    
    func appendPrepareForSegue(_ segues: [BlackboardSegue]) {
        append("override func prepare(for segue: UIStoryboardSegue, sender: Any?)") {
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
            
            // TODO: extract
            append("switch SegueIdentifier(rawValue: identifier) {")
            segues.forEach { segue in
                guard let viewControllerClassName = segue.viewControllerClassName else {
                    return
                }
                append("case .\(segue.enumName)?:")
                indent {
                    if let navigationControllerClassName = segue.navigationControllerClassName {
                        append("let navigationController = segue.destination as! \(navigationControllerClassName)")
                        append("let viewController = navigationController.viewControllers.first as! \(viewControllerClassName)")
                    }
                    else {
                        append("let viewController = segue.destination as! \(viewControllerClassName)")
                    }
                    append("\(segue.prepareFuncName)(\(viewControllerClassName.firstCharacterLowercased): viewController)")
                }
            }
            append("default:")
            indent {
                append("break")
            }
            append("}")
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
        append("final func \(segue.performFuncName)(_ initialize: ((\(viewControllerClassName)) -> Void)? = nil)") {
            append("var segueInitialization: SegueInitialization?")
            append("if let initialize = initialize") {
                append("segueInitialization = SegueInitialization") {
                    if let navigationControllerClassName = segue.navigationControllerClassName {
                        append("let navigationController = $0 as! \(navigationControllerClassName)")
                        append("let viewController = navigationController.viewControllers.first as! \(viewControllerClassName)")
                        append("initialize(viewController)")
                    }
                    else {
                        append("initialize($0 as! \(viewControllerClassName))")
                    }
                }
            }
            append("performSegue(withIdentifier: SegueIdentifier.\(segue.enumName).rawValue, sender: segueInitialization)")
        }
    }
    
    func appendPerformSequeFor(_ segue: BlackboardSegue) {
        append("final func \(segue.performFuncName)()") {
            append("performSegue(withIdentifier: SegueIdentifier.\(segue.enumName).rawValue, sender: nil)")
        }
    }
    
}
