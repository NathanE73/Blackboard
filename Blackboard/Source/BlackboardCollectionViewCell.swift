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

struct BlackboardCollectionViewCell {
    
    let name: String
    let identifier: String
    let className: String
    let parameterName: String
    
}

extension BlackboardCollectionViewCell {
    
    init?(collectionViewCell: StoryboardCollectionViewCell, storyboard: Storyboard) {
        guard let reuseIdentifier = collectionViewCell.reuseIdentifier else {
            return nil
        }
        
        name = nameFromIdentifier(reuseIdentifier)
            .stringByRemovingSuffixString("Cell")
        
        identifier = reuseIdentifier
        
        if let customClass = collectionViewCell.customClass {
            className = customClass
            
            parameterName = (customClass
                .stringByRemovingSuffixString("Cell")
                .stringByRemovingSuffixString("CollectionView")
                + "Cell")
                .lowercasedFirstCharacterString
        }
        else {
            className = "UICollectionViewCell"
            parameterName = "cell"
        }
    }
    
}

extension SwiftSource {
    
    func appendCollectionViewCells(_ collectionViewCells: [BlackboardCollectionViewCell]) {
        guard !collectionViewCells.isEmpty else { return }
        
        append("// Collection View Cells")
        append()
        appendCollectionViewCellIdentifier(collectionViewCells)
        appendDequeueCollectionViewCell(collectionViewCells)
        append()
    }
    
    func appendCollectionViewCellIdentifier(_ collectionViewCells: [BlackboardCollectionViewCell]) {
        guard !collectionViewCells.isEmpty else { return }
        
        append("enum CollectionViewCellIdentifier: String") {
            collectionViewCells.forEach { cell in
                append("case \(cell.name) = \"\(cell.identifier)\"")
            }
        }
        append()
    }
    
    func castFor(_ collectionViewCell: BlackboardCollectionViewCell) -> String {
        if collectionViewCell.className == "UICollectionViewCell" {
            return ""
        }
        return " as! \(collectionViewCell.className)"
    }
    
    func appendDequeueCollectionViewCell(_ collectionViewCells: [BlackboardCollectionViewCell]) {
        guard !collectionViewCells.isEmpty else { return }
        
        collectionViewCells.forEach { cell in
            append("final func dequeue\(cell.name)CellFrom(collectionView: UICollectionView, forIndexPath indexPath: NSIndexPath, @noescape initialize: ((\(cell.parameterName): \(cell.className)) -> Void) = {_ in}) -> \(cell.className)") {
                append("let collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewCellIdentifier.\(cell.name).rawValue, forIndexPath: indexPath)\(castFor(cell))")
                append("initialize(\(cell.parameterName): collectionViewCell)")
                append("return collectionViewCell")
            }
            append()
        }
    }
    
}
