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
    
    func appendTableViewCells(_ viewController: BlackboardViewController) {
        let tableViewCells = viewController.tableViewCells
        
        guard tableViewCells.isEmpty == false else { return }
        
        append("// Table View Cells")
        append()
        appendTableViewCellIdentifier(tableViewCells)
        appendDequeueTableViewCell(tableViewCells)
        append()
    }
    
    func appendTableViewCellIdentifier(_ tableViewCells: [BlackboardTableViewCell]) {
        guard tableViewCells.isEmpty == false else { return }
        
        append("enum TableViewCellIdentifier: String") {
            tableViewCells.forEach { cell in
                append("case \(cell.enumName) = \"\(cell.identifier)\"")
            }
        }
        append()
    }
    
    func appendDequeueTableViewCell(_ tableViewCells: [BlackboardTableViewCell]) {
        guard tableViewCells.isEmpty == false else { return }
        
        tableViewCells.forEach { cell in
            append("final func \(cell.dequeueFuncName)(from tableView: UITableView, for indexPath: IndexPath, initialize: ((_ \(cell.parameterName): \(cell.className)) -> Void)? = nil) -> \(cell.className)") {
                append("tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.\(cell.enumName).rawValue, for: indexPath, initialize)")
            }
            append()
        }
    }
    
}
