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

import XCTest

@testable import BlackboardFramework

class BlackboardTableViewCellTests: XCTestCase {
    
    func testMissingReuseIdentifier() {
        let storyboardCell = StoryboardTableViewCell(id: "cHC-Sw-7zu", reuseIdentifier: nil, customClass: nil)
        
        let blackboardCell = BlackboardTableViewCell(storyboardCell)
        
        XCTAssertNil(blackboardCell)
    }
    
    func testNameWithoutCellSuffix() {
        let storyboardCell = StoryboardTableViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "Account Summary", customClass: "AccountSummaryTableViewCell")
        
        let blackboardCell = BlackboardTableViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.name, "AccountSummary")
    }
    
    func testNameWithCellSuffix() {
        let storyboardCell = StoryboardTableViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "Account Summary Cell", customClass: "AccountSummaryTableViewCell")
        
        let blackboardCell = BlackboardTableViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.name, "AccountSummary")
    }
    
    func testEnumName() {
        let storyboardCell = StoryboardTableViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "User Profile Cell", customClass: "UserProfileTableViewCell")
        
        let blackboardCell = BlackboardTableViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.enumName, "userProfile")
    }
    
    func testIdentifier() {
        let storyboardCell = StoryboardTableViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "User Profile", customClass: "UserProfileTableViewCell")
        
        let blackboardCell = BlackboardTableViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.identifier, "User Profile")
    }
    
    func testWithoutCustomClass() {
        let storyboardCell = StoryboardTableViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "Cell", customClass: nil)
        
        let blackboardCell = BlackboardTableViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.className, "UITableViewCell")
        XCTAssertEqual(blackboardCell?.parameterName, "cell")
    }
    
    func testWithCustomClass() {
        let storyboardCell = StoryboardTableViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "BookOverview", customClass: "BookOverviewTableViewCell")
        
        let blackboardCell = BlackboardTableViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.className, "BookOverviewTableViewCell")
        XCTAssertEqual(blackboardCell?.parameterName, "bookOverviewCell")
    }
    
}
