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
    
    case CollectionViewController = "collectionViewController"
    case NavigationController = "navigationController"
    case PageViewController = "pageViewController"
    case SplitViewController = "splitViewController"
    case TabBarController = "tabBarController"
    case TableViewController = "tableViewController"
    case ViewController = "viewController"
    
    static let entries: [StoryboardViewControllerType] = [
        .CollectionViewController,
        .NavigationController,
        .PageViewController,
        .SplitViewController,
        .TabBarController,
        .TableViewController,
        .ViewController
    ]
    
    var className: String {
        switch self {
        case CollectionViewController:
            return "UICollectionViewController"
        case NavigationController:
            return "UINavigationController"
        case PageViewController:
            return "UIPageViewController"
        case SplitViewController:
            return "UISplitViewController"
        case TabBarController:
            return "UITabBarController"
        case TableViewController:
            return "UITableViewController"
        case ViewController:
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
    
    func segueWith(id id: String) -> StoryboardSegue? {
        return segues
            .filter { $0.id == id }
            .first
    }
    
    func segueWith(kind kind: StoryboardSegueKind) -> StoryboardSegue? {
        return segues
            .filter { $0.kind == kind }
            .first
    }
    
    func tableViewCellWith(id id: String) -> StoryboardTableViewCell? {
        return tableViewCells
            .filter { $0.id == id }
            .first
    }
    
    func collectionViewCellWith(id id: String) -> StoryboardCollectionViewCell? {
        return collectionViewCells
            .filter { $0.id == id }
            .first
    }
    
}

extension StoryboardViewController: CustomStringConvertible {
    
    var description: String {
        return "id: \(id), type: \(type), storyboardIdentifier: \(storyboardIdentifier ?? "nil"), customClass: \(customClass ?? "nil")"
    }
    
}

extension StoryboardViewController {
    
    init?(node: NSXMLNode) {
        let xpath = StoryboardViewControllerType.entries
            .map { ".//\($0.rawValue)" }
            .joinWithSeparator(" | ")
        
        guard let nodes = try? node.nodesForXPath(xpath),
            element = nodes.first as? NSXMLElement,
            elementName = element.name
            where nodes.count == 1 else {
                return nil
        }
        
        guard let id = element.attributeForName("id")?.stringValue else {
            return nil
        }
        
        guard let type = StoryboardViewControllerType(rawValue: elementName) else {
            return nil
        }
        
        let storyboardIdentifier = element.attributeForName("storyboardIdentifier")?.stringValue
        
        let customClass = element.attributeForName("customClass")?.stringValue
        
        guard let segueNodes = try? element.nodesForXPath(".//segue") else {
            return nil
        }
        let segues = segueNodes.flatMap(StoryboardSegue.init)
        
        guard let tableViewCellNodes = try? element.nodesForXPath(".//tableViewCell") else {
            return nil
        }
        let tableViewCells = tableViewCellNodes.flatMap(StoryboardTableViewCell.init)
        
        guard let collectionViewCellNodes = try? element.nodesForXPath(".//collectionViewCell") else {
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
