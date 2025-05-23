//
// Copyright (c) 2022 Nathan E. Walczak
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

struct BlackboardTableViewCell {
    
    var name: String
    var enumName: String
    var dequeueFuncName: String
    var identifier: String
    var className: String
    var parameterName: String
    
}

extension BlackboardTableViewCell {
    
    init?(_ tableViewCell: StoryboardTableViewCell) {
        guard let reuseIdentifier = tableViewCell.reuseIdentifier else {
            return nil
        }
        
        name = Naming.name(from: reuseIdentifier)
            .removingSuffix("Cell")
        
        enumName = (name.isEmpty
            ? Naming.name(from: reuseIdentifier)
            : name)
            .firstCharacterLowercased
        
        dequeueFuncName = "dequeue\(name)Cell"

        identifier = reuseIdentifier
        
        if let customClass = tableViewCell.customClass {
            className = customClass
            
            parameterName = (customClass
                .removingSuffix("Cell")
                .removingSuffix("TableView")
                + "Cell")
                .firstCharacterLowercased
        } else {
            className = "UITableViewCell"
            parameterName = "cell"
        }
    }
    
}
