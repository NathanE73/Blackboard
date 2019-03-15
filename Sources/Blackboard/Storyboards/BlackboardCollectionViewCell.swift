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

struct BlackboardCollectionViewCell {
    
    var name: String
    var enumName: String
    var identifier: String
    var className: String
    var parameterName: String
    
}

extension BlackboardCollectionViewCell {
    
    init?(_ collectionViewCell: StoryboardCollectionViewCell) {
        guard let reuseIdentifier = collectionViewCell.reuseIdentifier else {
            return nil
        }
        
        name = Naming.name(fromIdentifier: reuseIdentifier)
            .removingSuffix("Cell")
        
        enumName = name.firstCharacterLowercased
        
        identifier = reuseIdentifier
        
        if let customClass = collectionViewCell.customClass {
            className = customClass
            
            parameterName = (customClass
                .removingSuffix("Cell")
                .removingSuffix("CollectionView")
                + "Cell")
                .firstCharacterLowercased
        }
        else {
            className = "UICollectionViewCell"
            parameterName = "cell"
        }
    }
    
}
