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
    
    func appendViewControllers(_ viewControllers: [BlackboardViewController]) {
        viewControllers.forEach(appendViewController)
    }
    
    func appendViewController(_ viewController: BlackboardViewController) {
        let extends: String
        if viewController.segues.isEmpty {
            extends = ""
        } else {
            extends = ": \(viewController.className)Segues"
            appendViewControllerSeguesProtocol(viewController)
        }
        
        append("extension \(viewController.className)\(extends)") {
            append()
            appendInstantiateViewController(viewController)
            appendInstantiateNavigationController(viewController)
            appendSegues(viewController)
            appendTableViewCells(viewController)
            appendCollectionViewCells(viewController)
        }
        append()
    }
    
    func appendViewControllerSeguesProtocol(_ viewController: BlackboardViewController) {
        append("protocol \(viewController.className)Segues {}")
        append()
        
        append("extension \(viewController.className)Segues") {
            append()
            viewController.segues.forEach { segue in
                append("func \(segue.prepareFuncName)(_ \(segue.viewControllerParameterName): \(segue.viewControllerClassName)) {}")
            }
            append()
            viewController.shouldPerformSegues.forEach { segue in
                if let shouldPerformFuncName = segue.shouldPerformFuncName {
                    append("func \(shouldPerformFuncName)() -> Bool { return true }")
                }
            }
            append()
        }
        append()
    }
    
    func appendInstantiateViewController(_ viewController: BlackboardViewController) {
        guard let identifier = viewController.identifier else { return }
        
        append("final class func instantiateFromStoryboard(_ initialize: ((_ \(viewController.parameterName): \(viewController.className)) -> Void)? = nil) -> \(viewController.className)") {
            append("return instantiateViewController(from: sharedStoryboardInstance, identifier: \"\(identifier)\", initialize)")
        }
        append()
    }
    
    func appendInstantiateNavigationController(_ viewController: BlackboardViewController) {
        guard let navigationControllerIdentifier = viewController.navigationControllerIdentifier else { return }
        
        append("final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ \(viewController.parameterName): \(viewController.className)) -> Void)? = nil) -> UINavigationController") {
            append("return instantiateNavigationController(from: sharedStoryboardInstance, identifier: \"\(navigationControllerIdentifier)\", initialize)")
        }
        append()
    }
    
}
