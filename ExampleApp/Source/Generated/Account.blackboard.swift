//
//  Account.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

private let sharedStoryboardInstance = UIStoryboard(name: "Account", bundle: nil)

extension AccountViewController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ accountViewController: AccountViewController) -> Void)? = nil) -> AccountViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "AccountViewController", initialize)
    }
    
}

extension AccountsNavigationController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ accountsNavigationController: AccountsNavigationController) -> Void)? = nil) -> AccountsNavigationController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "AccountNavigationController", initialize)
    }
    
}

protocol AccountsTableViewControllerSegues {}

extension AccountsTableViewControllerSegues {
    
    func prepareForPresentOpenAccountSegue(_ openAccountViewController: OpenAccountViewController) {}
    func prepareForShowAccountSegue(_ accountViewController: AccountViewController) {}
    
}

extension AccountsTableViewController: AccountsTableViewControllerSegues {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ accountsTableViewController: AccountsTableViewController) -> Void)? = nil) -> AccountsTableViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "AccountTableViewController", initialize)
    }
    
    final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ accountsTableViewController: AccountsTableViewController) -> Void)? = nil) -> UINavigationController {
        return instantiateNavigationController(from: sharedStoryboardInstance, identifier: "AccountNavigationController", initialize)
    }
    
    // Segues
    
    enum SegueIdentifier: String {
        case presentOpenAccount = "Present Open Account"
        case showAccount = "Show Account"
    }
    
    final override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueInitialization = sender as? SegueInitialization {
            segueInitialization.block(segue.destination)
            return
        }
        
        guard let identifier = segue.identifier else {
            return
        }
        
        switch SegueIdentifier(rawValue: identifier) {
        case .presentOpenAccount?:
            let navigationController = segue.destination as! UINavigationController
            let viewController = navigationController.viewControllers.first as! OpenAccountViewController
            prepareForPresentOpenAccountSegue(viewController)
        case .showAccount?:
            let viewController = segue.destination as! AccountViewController
            prepareForShowAccountSegue(viewController)
        case .none:
            break
        }
    }
    
    final func performPresentOpenAccountSegue(_ initialize: ((OpenAccountViewController) -> Void)? = nil) {
        performNavigationControllerSegue(SegueIdentifier.presentOpenAccount.rawValue, initialize)
    }
    
    final func performShowAccountSegue(_ initialize: ((AccountViewController) -> Void)? = nil) {
        performViewControllerSegue(SegueIdentifier.showAccount.rawValue, initialize)
    }
    
    // Table View Cells
    
    enum TableViewCellIdentifier: String {
        case account = "Account"
        case accountOverview = "Account Overview"
        case openNewAccount = "Open New Account"
    }
    
    final func dequeueAccountCell(from tableView: UITableView, for indexPath: IndexPath, initialize: ((_ accountCell: AccountTableViewCell) -> Void)? = nil) -> AccountTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.account.rawValue, for: indexPath, initialize)
    }
    
    final func dequeueAccountOverviewCell(from tableView: UITableView, for indexPath: IndexPath, initialize: ((_ accountOverviewCell: AccountOverviewTableViewCell) -> Void)? = nil) -> AccountOverviewTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.accountOverview.rawValue, for: indexPath, initialize)
    }
    
    final func dequeueOpenNewAccountCell(from tableView: UITableView, for indexPath: IndexPath, initialize: ((_ cell: UITableViewCell) -> Void)? = nil) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.openNewAccount.rawValue, for: indexPath, initialize)
    }
    
}

extension OpenAccountViewController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ openAccountViewController: OpenAccountViewController) -> Void)? = nil) -> OpenAccountViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "OpenAccountViewController", initialize)
    }
    
    final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ openAccountViewController: OpenAccountViewController) -> Void)? = nil) -> UINavigationController {
        return instantiateNavigationController(from: sharedStoryboardInstance, identifier: "OpenAccountNavigationController", initialize)
    }
    
}
