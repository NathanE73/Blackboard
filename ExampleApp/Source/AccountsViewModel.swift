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

import Foundation

class AccountsViewModel {
    
    let name: String
    let rewardsLevel: String
    
    init(name: String, rewardsLevel: String) {
        self.name = name
        self.rewardsLevel = rewardsLevel
    }
    
    var accountsSectionTitle: String {
        "Personal Accounts"
    }
    
    var helloText: String {
        "Hello, \(name)"
    }
    
    var rewardsLevelText: String {
        "\(rewardsLevel) Rewards Level"
    }
    
}

extension AccountsViewModel {
    
    static var example: AccountsViewModel {
        AccountsViewModel(name: "Steve Dave", rewardsLevel: "Platinum Honors")
    }
    
}
