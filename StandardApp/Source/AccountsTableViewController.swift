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

class AccountsTableViewController: UITableViewController {
    
    var viewModel: AccountsViewModel!
    var accountViewModels: [AccountViewModel]!
    
    enum Section: Int, CaseIterable {
        case overview
        case accounts
        case openNewAccount
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Account" {
            if let accountViewController = segue.destination as? AccountViewController {
                let accountViewModel = sender as? AccountViewModel
                accountViewController.viewModel = accountViewModel
            }
        } else if segue.identifier == "Present Open Account" {
            if let navigationController = segue.destination as? UINavigationController,
                let openAccountViewController = navigationController.viewControllers.first as? OpenAccountViewController {
                openAccountViewController.path = "Perform Segue"
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section(rawValue: section)! {
        case .overview:
            return nil
        case .accounts:
            return viewModel.accountsSectionTitle
        case .openNewAccount:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .overview:
            return 1
        case .accounts:
            return accountViewModels.count
        case .openNewAccount:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section)! {
        case .overview:
            // swiftlint:disable:next force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: "Account Overview", for: indexPath) as! AccountOverviewTableViewCell
            cell.helloLabel.text = viewModel.helloText
            cell.rewardsLevelLabel.text = viewModel.rewardsLevelText
            return cell
        case .accounts:
            let accountViewModel = accountViewModels[indexPath.row]
            // swiftlint:disable:next force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: "Account", for: indexPath) as! AccountTableViewCell
            cell.nameLabel.text = accountViewModel.name
            cell.balanceLabel.text = accountViewModel.balance
            return cell
        case .openNewAccount:
            return tableView.dequeueReusableCell(withIdentifier: "Open New Account", for: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section(rawValue: indexPath.section)! {
        case .overview:
            break
        case .accounts:
            let accountViewModel = accountViewModels[indexPath.row]
            performSegue(withIdentifier: "Show Account", sender: accountViewModel)
        case .openNewAccount:
            performSegue(withIdentifier: "Present Open Account", sender: nil)
        }
    }
    
    @IBAction private func presentOpenAccount() {
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        // swiftlint:disable:next force_cast
        let navigationController = storyboard.instantiateViewController(withIdentifier: "OpenAccountNavigationController") as! UINavigationController
        // swiftlint:disable:next force_cast
        let openAccountViewController = navigationController.viewControllers.first as! OpenAccountViewController
        openAccountViewController.path = "Instantiate Navigation Controller"
        present(navigationController, animated: true)
    }
    
    @IBAction private func alternativePresentOpenAccount() {
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        // swiftlint:disable:next force_cast
        let openAccountViewController = storyboard.instantiateViewController(withIdentifier: "OpenAccountViewController") as! OpenAccountViewController
        openAccountViewController.path = "Instantiate View Controller"
        
        let navigationController = UINavigationController(rootViewController: openAccountViewController)
        present(navigationController, animated: true)
    }
    
    @IBAction private func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
