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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        handleSegue(segue, sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuContainerView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        revealMenu()
    }
    
    func revealMenu() {
        guard applicationNameTopLayoutConstraint.isActive == false else {
            return
        }
        
        UIView.animate(withDuration: 0.75) {
            self.applicationNameCenterYLayoutConstraint.isActive = false
            self.applicationNameTopLayoutConstraint.isActive = true
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.25) {
            self.menuContainerView.alpha = 1
        }
    }
    
    @IBAction func presentAccounts() {
        performPresentAccountsSegue { accountsTableViewController in
            accountsTableViewController.viewModel = AccountsViewModel.example
            accountsTableViewController.accountViewModels = AccountViewModel.examples
        }
    }
    
    @IBAction func presentOpenAccount() {
        performPresentOpenAccountSegue { openAccountViewController in
            openAccountViewController.path = "Storyboard Reference"
        }
    }
    
    @IBAction func presentPhotos() {
        performPresentPhotosSegue { photosViewController in
            photosViewController.photoViewModels = PhotoViewModel.examples
        }
    }
    
}
