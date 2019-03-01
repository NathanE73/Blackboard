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

struct BlackboardViewController {
    
    var className: String
    var identifier: String?
    var navigationControllerIdentifier: String?
    var parameterName: String
    
    var segues: [BlackboardSegue]
    var tableViewCells: [BlackboardTableViewCell]
    var collectionViewCells: [BlackboardCollectionViewCell]
    
}

extension BlackboardViewController {
    
    init?(_ viewController: StoryboardViewController, storyboard: Storyboard, storyboards: [Storyboard]) {
        guard let customClass = viewController.customClass else {
            return nil
        }
        
        className = customClass
        identifier = viewController.storyboardIdentifier
        navigationControllerIdentifier = storyboard.navigationControllerFor(id: viewController.id)?.storyboardIdentifier
        
        parameterName = customClass.firstCharacterLowercased
        
        segues = viewController.segues
            .compactMap { BlackboardSegue($0, storyboard: storyboard, storyboards: storyboards) }
            .sorted { $0.name < $1.name }
        
        tableViewCells = viewController.tableViewCells
            .compactMap(BlackboardTableViewCell.init)
            .sorted { $0.name < $1.name }
        
        collectionViewCells = viewController.collectionViewCells
            .compactMap(BlackboardCollectionViewCell.init)
            .sorted { $0.name < $1.name }
    }
    
}
