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
    
    let viewModel = AccountsViewModel.example
    let accountViewModels = AccountViewModel.examples
    
    enum Section: Int, CaseIterable {
        case overview
        case accounts
        case openNewAccount
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        handleSegue(segue, sender: sender)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
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
            return dequeueAccountOverviewCell(from: tableView, for: indexPath) { cell in
                cell.helloLabel.text = self.viewModel.helloText
                cell.rewardsLevelLabel.text = self.viewModel.rewardsLevelText
            }
        case .accounts:
            let accountViewModel = accountViewModels[indexPath.row]
            return dequeueAccountCell(from: tableView, for: indexPath) { cell in
                cell.nameLabel.text = accountViewModel.name
                cell.balanceLabel.text = accountViewModel.balance
            }
        case .openNewAccount:
            return dequeueOpenNewAccountCell(from: tableView, for: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section(rawValue: indexPath.section)! {
        case .overview:
            break
        case .accounts:
            let accountViewModel = accountViewModels[indexPath.row]
            performShowAccountSegue { accountViewController in
                accountViewController.viewModel = accountViewModel
            }
        case .openNewAccount:
            performPresentOpenAccountSegue() { openAccountViewController in
                openAccountViewController.path = "Perform Segue"
            }
        }
    }
    
    @IBAction func presentOpenAccount() {
        let navigationController = OpenAccountViewController.instantiateNavigationControllerFromStoryboard { openAccountViewController in
            openAccountViewController.path = "Instantiate Navigation Controller"
        }
        present(navigationController, animated: true)
    }
    
}
