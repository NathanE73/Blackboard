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

struct BlackboardViewController {
    
    let className: String
    let identifier: String?
    let navigationControllerIdentifier: String?
    let parameterName: String
    
    let segues: [BlackboardSegue]
    let tableViewCells: [BlackboardTableViewCell]
    let collectionViewCells: [BlackboardCollectionViewCell]
    
}

extension BlackboardViewController {
    
    init?(viewController: StoryboardViewController, storyboard: Storyboard) {
        guard let customClass = viewController.customClass else {
            return nil
        }
        
        className = customClass
        identifier = viewController.storyboardIdentifier
        navigationControllerIdentifier = storyboard.navigationControllerFor(id: viewController.id)?.storyboardIdentifier
        
        parameterName = customClass.lowercaseFirstCharacterString
        
        segues = viewController.segues
            .flatMap { BlackboardSegue(segue: $0, storyboard: storyboard) }
            .sort { $0.name < $1.name }
        
        tableViewCells = viewController.tableViewCells
            .flatMap { BlackboardTableViewCell(tableViewCell: $0, storyboard: storyboard) }
            .sort { $0.name < $1.name }
        
        collectionViewCells = viewController.collectionViewCells
            .flatMap { BlackboardCollectionViewCell(collectionViewCell: $0, storyboard: storyboard) }
            .sort { $0.name < $1.name }
    }
    
}

extension SwiftSource {
    
    func appendViewControllers(viewControllers: [BlackboardViewController]) {
        viewControllers.forEach { viewController in
            append("extension \(viewController.className)") {
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
    
    func appendInstantiateViewController(viewController: BlackboardViewController) {
        guard let identifier = viewController.identifier else { return }
        
        append("final class func instantiateViewControllerFromStoryboard(@noescape initialize: ((\(viewController.parameterName): \(viewController.className)) -> Void) = {_ in}) -> \(viewController.className)") {
            append("let viewController = sharedStoryboardInstance.instantiateViewControllerWithIdentifier(\"\(identifier)\") as! \(viewController.className)")
            append("initialize(\(viewController.parameterName): viewController)")
            append("return viewController")
        }
        append()
    }
    
    func appendInstantiateNavigationController(viewController: BlackboardViewController) {
        guard let navigationControllerIdentifier = viewController.navigationControllerIdentifier else { return }
        
        append("final class func instantiateNavigationControllerFromStoryboard(@noescape initialize: ((\(viewController.parameterName): \(viewController.className)) -> Void) = {_ in}) -> UINavigationController") {
            append("let navigationController = sharedStoryboardInstance.instantiateViewControllerWithIdentifier(\"\(navigationControllerIdentifier)\") as! UINavigationController")
            append("let viewController = navigationController.viewControllers.first as! \(viewController.className)")
            append("initialize(\(viewController.parameterName): viewController)")
            append("return navigationController")
        }
        append()
    }
    
}
