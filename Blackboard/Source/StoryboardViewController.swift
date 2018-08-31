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

extension StoryboardViewController {
    
    enum ControllerType: String, CaseIterable {
        
        case collectionViewController
        case navigationController
        case pageViewController
        case splitViewController
        case tabBarController
        case tableViewController
        case viewController
        case viewControllerPlaceholder
        
        var className: String? {
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
            case .viewControllerPlaceholder:
                return nil
            }
        }
        
    }
    
}

struct StoryboardViewController {
    
    let id: String
    
    let type: ControllerType
    let storyboardIdentifier: String?
    let customClass: String?
    let storyboardName: String?
    
    let segues: [StoryboardSegue]
    let tableViewCells: [StoryboardTableViewCell]
    let collectionViewCells: [StoryboardCollectionViewCell]
    
}

extension StoryboardViewController {
    
    func segueWith(id: String) -> StoryboardSegue? {
        return segues
            .first { $0.id == id }
    }
    
    func segueWith(kind: StoryboardSegue.Kind) -> StoryboardSegue? {
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
        return "id: \(id), type: \(type), storyboardIdentifier: \(storyboardIdentifier ?? "nil")"
            + ", customClass: \(customClass ?? "nil"), storyboardName: \(storyboardName ?? "nil")"
    }
    
}

extension StoryboardViewController {
    
    init?(node: XMLNode?) {
        let xpath = ControllerType.allCases
            .map { ".//\($0.rawValue)" }
            .joined(separator: " | ")
        
        guard let node = node,
            let nodes = try? node.nodes(forXPath: xpath),
            nodes.count == 1,
            let element = nodes.first as? XMLElement,
            let elementName = element.name,
            let type = ControllerType(rawValue: elementName),
            let segueNodes = try? element.nodes(forXPath: ".//segue"),
            let tableViewCellNodes = try? element.nodes(forXPath: ".//tableViewCell"),
            let collectionViewCellNodes = try? element.nodes(forXPath: ".//collectionViewCell") else {
                return nil
        }

        guard let id = element.attribute(forName: "id")?.stringValue else {
            return nil
        }
        self.id = id
        
        self.type = type
        
        storyboardIdentifier = element.attribute(forName: "storyboardIdentifier")?.stringValue
        
        customClass = element.attribute(forName: "customClass")?.stringValue
        
        storyboardName = element.attribute(forName: "storyboardName")?.stringValue
        
        segues = segueNodes.compactMap(StoryboardSegue.init)
        
        tableViewCells = tableViewCellNodes.compactMap(StoryboardTableViewCell.init)
        
        collectionViewCells = collectionViewCellNodes.compactMap(StoryboardCollectionViewCell.init)
    }
    
}
