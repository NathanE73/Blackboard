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

struct BlackboardTableViewCell {
    
    let name: String
    let identifier: String
    let className: String
    let parameterName: String
    
}

extension BlackboardTableViewCell {
    
    init?(tableViewCell: StoryboardTableViewCell, storyboard: Storyboard) {
        guard let reuseIdentifier = tableViewCell.reuseIdentifier else {
            return nil
        }
        
        name = nameFromIdentifier(reuseIdentifier)
            .stringByRemovingSuffixString("Cell")
        
        identifier = reuseIdentifier
        
        if let customClass = tableViewCell.customClass {
            className = customClass
            
            parameterName = customClass
                .stringByRemovingSuffixString("Cell")
                .stringByRemovingSuffixString("TableView") + "Cell"
                .lowercaseFirstCharacterString
        }
        else {
            className = "UITableViewCell"
            parameterName = "cell"
        }
    }
    
}

extension SwiftSource {
    
    func appendTableViewCells(_ tableViewCells: [BlackboardTableViewCell]) {
        guard !tableViewCells.isEmpty else { return }
        
        append("// Table View Cells")
        append()
        appendTableViewCellIdentifier(tableViewCells)
        appendDequeueTableViewCell(tableViewCells)
        append()
    }
    
    func appendTableViewCellIdentifier(_ tableViewCells: [BlackboardTableViewCell]) {
        guard !tableViewCells.isEmpty else { return }
        
        append("enum TableViewCellIdentifier: String") {
            tableViewCells.forEach { cell in
                append("case \(cell.name.lowercaseFirstCharacterString) = \"\(cell.identifier)\"")
            }
        }
        append()
    }
    
    func castFor(_ tableViewCell: BlackboardTableViewCell) -> String {
        if tableViewCell.className == "UITableViewCell" {
            return ""
        }
        return " as! \(tableViewCell.className)"
    }
    
    func appendDequeueTableViewCell(_ tableViewCells: [BlackboardTableViewCell]) {
        guard !tableViewCells.isEmpty else { return }
        
        tableViewCells.forEach { cell in
            append("final func dequeue\(cell.name)Cell(fromTableView: UITableView, forIndexPath indexPath: IndexPath, initialize:  (@noescape (\(cell.parameterName): \(cell.className)) -> Void)? = nil) -> \(cell.className)") {
                append("let tableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.\(cell.name.lowercaseFirstCharacterString).rawValue, for: indexPath)\(castFor(cell))")
                append("initialize?(\(cell.parameterName): tableViewCell)")
                append("return tableViewCell")
            }
            append()
        }
    }
    
}
