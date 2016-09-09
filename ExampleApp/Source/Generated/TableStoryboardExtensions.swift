//
//  TableStoryboardExtensions.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

private let sharedStoryboardInstance = UIStoryboard(name: "Table", bundle: nil)

private class InitializeBlockObject {
    
    let block: ((UIViewController) -> Void)
    
    init(block: @escaping ((UIViewController) -> Void)) {
        self.block = block
    }
    
}

extension NameViewController {
    
    final class func instantiateViewControllerFromStoryboard(_ initialize: ((_ nameViewController: NameViewController) -> Void) = {_ in}) -> NameViewController {
        let viewController = sharedStoryboardInstance.instantiateViewController(withIdentifier: "NameViewController") as! NameViewController
        initialize(viewController)
        return viewController
    }
    
    // Segues
    
    func handleSegue(_ segue: UIStoryboardSegue, sender: Any?) {
        if let initializeBlockObject = sender as? InitializeBlockObject {
            initializeBlockObject.block(segue.destination)
        }
    }
    
}

extension NamesViewController {
    
    final class func instantiateViewControllerFromStoryboard(_ initialize: ((_ namesViewController: NamesViewController) -> Void) = {_ in}) -> NamesViewController {
        let viewController = sharedStoryboardInstance.instantiateViewController(withIdentifier: "NamesViewController") as! NamesViewController
        initialize(viewController)
        return viewController
    }
    
    final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ namesViewController: NamesViewController) -> Void) = {_ in}) -> UINavigationController {
        let navigationController = sharedStoryboardInstance.instantiateViewController(withIdentifier: "NamesNavigationController") as! UINavigationController
        let viewController = navigationController.viewControllers.first as! NamesViewController
        initialize(viewController)
        return navigationController
    }
    
    // Segues
    
    enum SegueIdentifier: String {
        case ShowName = "ShowName"
    }
    
    func handleSegue(_ segue: UIStoryboardSegue, sender: Any?) {
        if let initializeBlockObject = sender as? InitializeBlockObject {
            initializeBlockObject.block(segue.destination)
        }
    }
    
    final func performShowNameSegue(_ initialize: @escaping ((NameViewController) -> Void) = {_ in}) {
        let initializeBlock = InitializeBlockObject() {
            initialize($0 as! NameViewController)
        }
        performSegue(withIdentifier: SegueIdentifier.ShowName.rawValue, sender: initializeBlock)
    }
    
    // Table View Cells
    
    enum TableViewCellIdentifier: String {
        case Name = "Name"
    }
    
    final func dequeueNameCellFrom(_ tableView: UITableView, forIndexPath indexPath: IndexPath, initialize: ((_ nameCell: NameTableViewCell) -> Void) = {_ in}) -> NameTableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.Name.rawValue, for: indexPath) as! NameTableViewCell
        initialize(tableViewCell)
        return tableViewCell
    }
    
}
