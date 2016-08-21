//
//  TableStoryboardExtensions.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

private let tableStoryboard = Storyboards.table.storyboard

enum TableStoryboardViewControllers: String {
    case nameViewController = "NameViewController"
    case namesViewController = "NamesViewController"
    case namesNavigationController = "NamesNavigationController"
}

extension NameViewController {
    
    final class func instantiateFromStoryboard(withInitializer initializer: ((_ nameViewController: NameViewController) -> Void)? = nil) -> NameViewController {
        let viewController = tableStoryboard.instantiateViewController(withIdentifier: TableStoryboardViewControllers.nameViewController.rawValue) as! NameViewController
        initializer?(viewController)
        
        return viewController
    }
    
    // Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        handleSegue(segue, sender: sender)
    }
    
}

extension NamesViewController {
    
    final class func instantiateFromStoryboard(withInitializer initializer: ((_ namesViewController: NamesViewController) -> Void)? = nil) -> NamesViewController {
        let viewController = tableStoryboard.instantiateViewController(withIdentifier: TableStoryboardViewControllers.namesViewController.rawValue) as! NamesViewController
        initializer?(viewController)
        
        return viewController
    }
    
    final class func instantiateWithNavigationControllerFromStoryboard(withInitializer initializer: ((_ namesViewController: NamesViewController) -> Void)? = nil) -> UINavigationController {
        let navigationController = tableStoryboard.instantiateViewController(withIdentifier: TableStoryboardViewControllers.namesNavigationController.rawValue) as! UINavigationController
        let viewController = navigationController.viewControllers.first as! NamesViewController
        initializer?(viewController)
        
        return navigationController
    }
    
    // Segues
    
    enum SegueIdentifier: String {
        case showName = "ShowName"
    }

    final func performShowNameSegue(withInitializer initializer: ( (_ nameViewController: NameViewController) -> Void)? = nil) {
        let initializer = ViewControllerInitializer {
            initializer?($0 as! NameViewController)
        }
        
        performSegue(withIdentifier: SegueIdentifier.showName.rawValue, sender: initializer)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        handleSegue(segue, sender: sender)
    }
    
    // Table View Cells
    
    enum TableViewCellIdentifier: String {
        case name = "Name"
    }
    
    final func dequeueNameCellFrom(_ tableView: UITableView, forIndexPath indexPath: IndexPath, initializer: ((_ nameCell: NameTableViewCell) -> Void)? = nil) -> NameTableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.name.rawValue, for: indexPath) as! NameTableViewCell
        initializer?(tableViewCell)
        
        return tableViewCell
    }
    
}
