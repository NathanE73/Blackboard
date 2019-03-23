//
//  Main.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

private let sharedStoryboardInstance = UIStoryboard(name: "Main", bundle: nil)

extension FooterViewController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ footerViewController: FooterViewController) -> Void)? = nil) -> FooterViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "FooterViewController", initialize)
    }
    
}

protocol MainViewControllerSegues {}

extension MainViewControllerSegues {
    
    func prepareForFooterSegue(_ footerViewController: FooterViewController) {}
    func prepareForPresentAccountsSegue(_ accountsTableViewController: AccountsTableViewController) {}
    func prepareForPresentOpenAccountSegue(_ openAccountViewController: OpenAccountViewController) {}
    func prepareForPresentPhotoSegue(_ photoViewController: PhotoViewController) {}
    func prepareForPresentPhotosSegue(_ photosCollectionViewController: PhotosCollectionViewController) {}
    
    func shouldPerformFooterSegue() -> Bool { return true }
    func shouldPerformPresentAccountsSegue() -> Bool { return true }
    func shouldPerformPresentOpenAccountSegue() -> Bool { return true }
    func shouldPerformPresentPhotoSegue() -> Bool { return true }
    func shouldPerformPresentPhotosSegue() -> Bool { return true }
    
}

extension MainViewController: MainViewControllerSegues {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ mainViewController: MainViewController) -> Void)? = nil) -> MainViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "WelcomeViewController", initialize)
    }
    
    // Segues
    
    enum SegueIdentifier: String {
        case footer = "Footer"
        case presentAccounts = "Present Accounts"
        case presentOpenAccount = "Present Open Account"
        case presentPhoto = "Present Photo"
        case presentPhotos = "Present Photos"
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
        case .footer?:
            let viewController = segue.destination as! FooterViewController
            prepareForFooterSegue(viewController)
        case .presentAccounts?:
            let navigationController = segue.destination as! AccountsNavigationController
            let viewController = navigationController.viewControllers.first as! AccountsTableViewController
            prepareForPresentAccountsSegue(viewController)
        case .presentOpenAccount?:
            let navigationController = segue.destination as! UINavigationController
            let viewController = navigationController.viewControllers.first as! OpenAccountViewController
            prepareForPresentOpenAccountSegue(viewController)
        case .presentPhoto?:
            let navigationController = segue.destination as! UINavigationController
            let viewController = navigationController.viewControllers.first as! PhotoViewController
            prepareForPresentPhotoSegue(viewController)
        case .presentPhotos?:
            let navigationController = segue.destination as! PhotosNavigationController
            let viewController = navigationController.viewControllers.first as! PhotosCollectionViewController
            prepareForPresentPhotosSegue(viewController)
        case .none:
            break
        }
    }
    
    final override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch SegueIdentifier(rawValue: identifier) {
        case .footer?:
            return shouldPerformFooterSegue()
        case .presentAccounts?:
            return shouldPerformPresentAccountsSegue()
        case .presentOpenAccount?:
            return shouldPerformPresentOpenAccountSegue()
        case .presentPhoto?:
            return shouldPerformPresentPhotoSegue()
        case .presentPhotos?:
            return shouldPerformPresentPhotosSegue()
        case .none:
            return true
        }
    }
    
    final func performFooterSegue(_ initialize: ((FooterViewController) -> Void)? = nil) {
        performViewControllerSegue(SegueIdentifier.footer.rawValue, initialize)
    }
    
    final func performPresentAccountsSegue(_ initialize: ((AccountsTableViewController) -> Void)? = nil) {
        performNavigationControllerSegue(SegueIdentifier.presentAccounts.rawValue, initialize)
    }
    
    final func performPresentOpenAccountSegue(_ initialize: ((OpenAccountViewController) -> Void)? = nil) {
        performNavigationControllerSegue(SegueIdentifier.presentOpenAccount.rawValue, initialize)
    }
    
    final func performPresentPhotoSegue(_ initialize: ((PhotoViewController) -> Void)? = nil) {
        performNavigationControllerSegue(SegueIdentifier.presentPhoto.rawValue, initialize)
    }
    
    final func performPresentPhotosSegue(_ initialize: ((PhotosCollectionViewController) -> Void)? = nil) {
        performNavigationControllerSegue(SegueIdentifier.presentPhotos.rawValue, initialize)
    }
    
}
