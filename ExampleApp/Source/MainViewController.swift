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

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var applicationNameTopLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var applicationNameCenterYLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet var menuContainerView: UIView!
    
    var footerViewController: FooterViewController!
    
    func prepareForFooterSegue(_ footerViewController: FooterViewController) {
        self.footerViewController = footerViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuContainerView.alpha = 0
        
        footerViewController.footerText = L.greetings(arg1: "Steve", arg2: "Dave")
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
        performPresentAccountsSegue { accountsTableViewController in
            accountsTableViewController.viewModel = AccountsViewModel.example
            accountsTableViewController.accountViewModels = AccountViewModel.examples
        }
    }
    
    @IBAction private func presentOpenAccount() {
        performPresentOpenAccountSegue { openAccountViewController in
            openAccountViewController.path = "Storyboard Reference"
        }
    }
    
    // Photo Actions
    
    @IBAction private func presentPhotos() {
        performPresentPhotosSegue { photosCollectionViewController in
            photosCollectionViewController.photoViewModels = PhotoViewModel.examples
        }
    }
    
    func shouldPerformPresentPhotoSegue() -> Bool {
        PhotoViewModel.examples.first != nil
    }
    
    func prepareForPresentPhotoSegue(_ photoViewController: PhotoViewController) {
        photoViewController.viewModel = PhotoViewModel.examples.first
    }
    
    @IBAction private func presentFirstPhoto() {
        performPresentPhotoSegue()
    }
    
    @IBAction private func presentLastPhoto() {
        performPresentPhotoSegue { photoViewController in
            photoViewController.viewModel = PhotoViewModel.examples.last
        }
    }
    
}
