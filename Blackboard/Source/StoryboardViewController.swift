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

enum StoryboardViewControllerType: String {
    
    case collectionViewController = "collectionViewController"
    case navigationController = "navigationController"
    case pageViewController = "pageViewController"
    case splitViewController = "splitViewController"
    case tabBarController = "tabBarController"
    case tableViewController = "tableViewController"
    case viewController = "viewController"
    
    static let entries: [StoryboardViewControllerType] = [
        .collectionViewController,
        .navigationController,
        .pageViewController,
        .splitViewController,
        .tabBarController,
        .tableViewController,
        .viewController
    ]
    
    var className: String {
        switch self {
        case .collectionViewController:
            return "UICollectionViewController"
        case .navigationController:
            return "UINavigationController"
        case .pageViewController:
            return "UIPageViewController"
        case .splitViewController:
            return "UISplitViewController"
        case .tabBarController:
            return "UITabBarController"
        case .tableViewController:
            return "UITableViewController"
        case .viewController:
            return "UIViewController"
        }
    }
    
}

struct StoryboardViewController {
    
    let id: String
    
    let type: StoryboardViewControllerType
    let storyboardIdentifier: String?
    let customClass: String?
    
    let segues: [StoryboardSegue]
    let tableViewCells: [StoryboardTableViewCell]
    let collectionViewCells: [StoryboardCollectionViewCell]
    
}

extension StoryboardViewController {
    
    func segueWith(id: String) -> StoryboardSegue? {
        return segues
            .first { $0.id == id }
    }
    
    func segueWith(kind: StoryboardSegueKind) -> StoryboardSegue? {
        return segues
            .first { $0.kind == kind }
    }
    
    func tableViewCellWith(id: String) -> StoryboardTableViewCell? {
        return tableViewCells
            .first { $0.id == id }
    }
    
    func collectionViewCellWith(id: String) -> StoryboardCollectionViewCell? {
        return collectionViewCells
            .first { $0.id == id }
    }
    
}

extension StoryboardViewController: CustomStringConvertible {
    
    var description: String {
        return "id: \(id), type: \(type), storyboardIdentifier: \(storyboardIdentifier ?? "nil"), customClass: \(customClass ?? "nil")"
    }
    
}

extension StoryboardViewController {
    
    init?(node: XMLNode) {
        let xpath = StoryboardViewControllerType.entries
            .map { ".//\($0.rawValue)" }
            .joined(separator: " | ")
        
        guard let nodes = try? node.nodes(forXPath: xpath),
            let element = nodes.first as? XMLElement,
            let elementName = element.name,
            nodes.count == 1 else {
                return nil
        }
        
        guard let id = element.attribute(forName: "id")?.stringValue else {
            return nil
        }
        
        guard let type = StoryboardViewControllerType(rawValue: elementName) else {
            return nil
        }
        
        let storyboardIdentifier = element.attribute(forName: "storyboardIdentifier")?.stringValue
        
        let customClass = element.attribute(forName: "customClass")?.stringValue
        
        guard let segueNodes = try? element.nodes(forXPath: ".//segue") else {
            return nil
        }
        let segues = segueNodes.flatMap(StoryboardSegue.init)
        
        guard let tableViewCellNodes = try? element.nodes(forXPath: ".//tableViewCell") else {
            return nil
        }
        let tableViewCells = tableViewCellNodes.flatMap(StoryboardTableViewCell.init)
        
        guard let collectionViewCellNodes = try? element.nodes(forXPath: ".//collectionViewCell") else {
            return nil
        }
        let collectionViewCells = collectionViewCellNodes.flatMap(StoryboardCollectionViewCell.init)
        
        self.id = id
        self.type = type
        self.storyboardIdentifier = storyboardIdentifier
        self.customClass = customClass
        self.segues = segues
        self.tableViewCells = tableViewCells
        self.collectionViewCells = collectionViewCells
    }
    
}
