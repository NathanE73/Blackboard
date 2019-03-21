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
        viewControllers.forEach { viewController in
            // TODO: extract
            append("protocol \(viewController.className)Segues") {
            }
            append()
            
            // TODO: extract
            append("extension \(viewController.className)Segues") {
                append()
                viewController.segues.forEach { segue in
                    guard let viewControllerClassName = segue.viewControllerClassName else {
                        return
                    }
                    append("func \(segue.prepareFuncName)(\(viewControllerClassName.firstCharacterLowercased): \(viewControllerClassName))") {
                    }
                    append()
                }
            }
            append()
            
            // TODO: skip protocol if no segues?
            append("extension \(viewController.className): \(viewController.className)Segues") {
                append()
                appendInstantiateViewController(viewController)
                appendInstantiateNavigationController(viewController)
                appendSegues(viewController.segues)
                appendTableViewCells(viewController.tableViewCells)
                appendCollectionViewCells(viewController.collectionViewCells)
            }
            append()
        }
    }
    
    func appendInstantiateViewController(_ viewController: BlackboardViewController) {
        guard let identifier = viewController.identifier else { return }
        
        append("final class func instantiateFromStoryboard(_ initialize: ((_ \(viewController.parameterName): \(viewController.className)) -> Void)? = nil) -> \(viewController.className)") {
            append("let viewController = sharedStoryboardInstance.instantiateViewController(withIdentifier: \"\(identifier)\") as! \(viewController.className)")
            append("initialize?(viewController)")
            append("return viewController")
        }
        append()
    }
    
    func appendInstantiateNavigationController(_ viewController: BlackboardViewController) {
        guard let navigationControllerIdentifier = viewController.navigationControllerIdentifier else { return }
        
        append("final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ \(viewController.parameterName): \(viewController.className)) -> Void)? = nil) -> UINavigationController") {
            append("let navigationController = sharedStoryboardInstance.instantiateViewController(withIdentifier: \"\(navigationControllerIdentifier)\") as! UINavigationController")
            append("let viewController = navigationController.viewControllers.first as! \(viewController.className)")
            append("initialize?(viewController)")
            append("return navigationController")
        }
        append()
    }
    
}
