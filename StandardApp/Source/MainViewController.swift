//
// Copyright (c) 2022 Nathan E. Walczak
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

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var applicationNameTopLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var applicationNameCenterYLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet var menuContainerView: UIView!
    
    var footerViewController: FooterViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let footerViewController = segue.destination as? FooterViewController {
            self.footerViewController = footerViewController
        } else if segue.identifier == "Present Accounts" {
            if let accountsNavigationController = segue.destination as? AccountsNavigationController,
                let accountsTableViewController = accountsNavigationController.viewControllers.first as? AccountsTableViewController {
                accountsTableViewController.viewModel = AccountsViewModel.example
                accountsTableViewController.accountViewModels = AccountViewModel.examples
            }
        } else if segue.identifier == "Present Open Account" {
            if let navigationController = segue.destination as? UINavigationController,
                let openAccountViewController = navigationController.viewControllers.first as? OpenAccountViewController {
                openAccountViewController.path = "Storyboard Reference"
            }
        } else if segue.identifier == "Present Photos" {
            if let photosNavigationController = segue.destination as? PhotosNavigationController,
                let photosCollectionViewController = photosNavigationController.viewControllers.first as? PhotosCollectionViewController {
                photosCollectionViewController.photoViewModels = PhotoViewModel.examples
            }
        } else if segue.identifier == "Present Photo" {
            if let navigationController = segue.destination as? UINavigationController,
                let photoViewController = navigationController.viewControllers.first as? PhotoViewController {
                let photoViewModel = sender as? PhotoViewModel ?? PhotoViewModel.examples.first
                photoViewController.viewModel = photoViewModel
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Present Photo" {
            return PhotoViewModel.examples.first != nil
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuContainerView.alpha = 0
        
        let firstName = "Steve"
        let lastName = "Dave"
        footerViewController.footerText = "Greetings, \(firstName) \(lastName)!"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        revealMenu()
    }
    
    func revealMenu() {
        guard applicationNameTopLayoutConstraint.isActive == false else {
            return
        }
        
        UIView.animate(withDuration: 0.75, delay: 0.25, animations: {
            self.applicationNameCenterYLayoutConstraint.isActive = false
            self.applicationNameTopLayoutConstraint.isActive = true
            self.view.layoutIfNeeded()
        })
        
        UIView.animate(withDuration: 0.50, delay: 0.25, animations: {
            self.menuContainerView.alpha = 1
        })
    }
    
    // Account Actions
    
    @IBAction private func presentAccounts() {
        performSegue(withIdentifier: "Present Accounts", sender: nil)
    }
    
    @IBAction private func presentOpenAccount() {
        performSegue(withIdentifier: "Present Open Account", sender: nil)
    }
    
    // Photo Actions
    
    @IBAction private func presentPhotos() {
        performSegue(withIdentifier: "Present Photos", sender: nil)
    }
    
    @IBAction private func presentFirstPhoto() {
        performSegue(withIdentifier: "Present Photo", sender: nil)
    }
    
    @IBAction private func presentLastPhoto() {
        performSegue(withIdentifier: "Present Photo", sender: PhotoViewModel.examples.last)
    }
    
}
