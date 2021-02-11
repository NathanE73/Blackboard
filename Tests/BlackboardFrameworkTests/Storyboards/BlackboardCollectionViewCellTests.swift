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

import XCTest

@testable import BlackboardFramework

class BlackboardCollectionViewCellTests: XCTestCase {
    
    func testMissingReuseIdentifier() {
        let storyboardCell = StoryboardCollectionViewCell(id: "cHC-Sw-7zu", reuseIdentifier: nil, customClass: nil)
        
        let blackboardCell = BlackboardCollectionViewCell(storyboardCell)
        
        XCTAssertNil(blackboardCell)
    }
    
    func testNameWithoutCellSuffix() {
        let storyboardCell = StoryboardCollectionViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "Account Summary", customClass: "AccountSummaryCollectionViewCell")
        
        let blackboardCell = BlackboardCollectionViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.name, "AccountSummary")
    }
    
    func testNameWithCellSuffix() {
        let storyboardCell = StoryboardCollectionViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "Account Summary Cell", customClass: "AccountSummaryCollectionViewCell")
        
        let blackboardCell = BlackboardCollectionViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.name, "AccountSummary")
    }
    
    func testEnumName() {
        let storyboardCell = StoryboardCollectionViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "User Profile Cell", customClass: "UserProfileCollectionViewCell")
        
        let blackboardCell = BlackboardCollectionViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.enumName, "userProfile")
    }
    
    func testIdentifier() {
        let storyboardCell = StoryboardCollectionViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "User Profile", customClass: "UserProfileCollectionViewCell")
        
        let blackboardCell = BlackboardCollectionViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.identifier, "User Profile")
    }
    
    func testWithoutCustomClass() {
        let storyboardCell = StoryboardCollectionViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "Cell", customClass: nil)
        
        let blackboardCell = BlackboardCollectionViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.className, "UICollectionViewCell")
        XCTAssertEqual(blackboardCell?.parameterName, "cell")
    }
    
    func testWithCustomClass() {
        let storyboardCell = StoryboardCollectionViewCell(id: "cHC-Sw-7zu", reuseIdentifier: "BookOverview", customClass: "BookOverviewCollectionViewCell")
        
        let blackboardCell = BlackboardCollectionViewCell(storyboardCell)
        
        XCTAssertEqual(blackboardCell?.className, "BookOverviewCollectionViewCell")
        XCTAssertEqual(blackboardCell?.parameterName, "bookOverviewCell")
    }
    
}
