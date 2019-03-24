//
//  Supported.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

private let sharedStoryboardInstance = UIStoryboard(name: "Supported", bundle: nil)

extension EmptyCollectionViewController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ emptyCollectionViewController: EmptyCollectionViewController) -> Void)? = nil) -> EmptyCollectionViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "EmptyCollectionViewController", initialize)
    }
    
    // Collection View Cells
    
    enum CollectionViewCellIdentifier: String {
        case cell = "Cell"
    }
    
    final func dequeueCell(from collectionView: UICollectionView, for indexPath: IndexPath, initialize: ((_ cell: UICollectionViewCell) -> Void)? = nil) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.cell.rawValue, for: indexPath, initialize)
    }
    
}

extension EmptyNavigationController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ emptyNavigationController: EmptyNavigationController) -> Void)? = nil) -> EmptyNavigationController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "EmptyNavigationController", initialize)
    }
    
}

extension EmptyPageViewController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ emptyPageViewController: EmptyPageViewController) -> Void)? = nil) -> EmptyPageViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "EmptyPageViewController", initialize)
    }
    
}

extension EmptyTabBarController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ emptyTabBarController: EmptyTabBarController) -> Void)? = nil) -> EmptyTabBarController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "EmptyTabBarController", initialize)
    }
    
}

extension EmptyTableViewController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ emptyTableViewController: EmptyTableViewController) -> Void)? = nil) -> EmptyTableViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "EmptyTableViewController", initialize)
    }
    
    // Table View Cells
    
    enum TableViewCellIdentifier: String {
        case cell = "Cell"
    }
    
    final func dequeueCell(from tableView: UITableView, for indexPath: IndexPath, initialize: ((_ cell: UITableViewCell) -> Void)? = nil) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.cell.rawValue, for: indexPath, initialize)
    }
    
}

extension EmptyViewController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ emptyViewController: EmptyViewController) -> Void)? = nil) -> EmptyViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "EmptyViewController", initialize)
    }
    
    final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ emptyViewController: EmptyViewController) -> Void)? = nil) -> UINavigationController {
        return instantiateNavigationController(from: sharedStoryboardInstance, identifier: "EmptyNavigationController", initialize)
    }
    
}
