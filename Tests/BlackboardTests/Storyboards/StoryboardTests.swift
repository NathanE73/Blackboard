//
// Copyright (c) 2018 Nathan E. Walczak
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

@testable import Blackboard

class StoryboardTests: XCTestCase {
    
    func testAccount() {
        let storyboard = Storyboard(name: "Account", data: AccountStoryboardTestData)
        
        XCTAssertEqual(storyboard?.name, "Account")
        XCTAssertEqual(storyboard?.initialViewControllerIdentifier, "LYS-UF-AgY")
        
        XCTAssertEqual(storyboard?.viewControllers.count, 5)
    }
    
    func testEmpty() {
        let storyboard = Storyboard(name: "Empty", data: EmptyStoryboardTestData)
        
        XCTAssertEqual(storyboard?.name, "Empty")
        XCTAssertNil(storyboard?.initialViewControllerIdentifier)
        
        XCTAssertEqual(storyboard?.viewControllers.count, 0)
    }
    
    func testLaunchScreen() {
        let storyboard = Storyboard(name: "LaunchScreen", data: LaunchScreenStoryboardTestData)
        
        XCTAssertNil(storyboard)
    }
    
    func testMain() {
        let storyboard = Storyboard(name: "Main", data: MainStoryboardTestData)
        
        XCTAssertEqual(storyboard?.name, "Main")
        XCTAssertEqual(storyboard?.initialViewControllerIdentifier, "BYZ-38-t0r")
        
        XCTAssertEqual(storyboard?.viewControllers.count, 4)
    }
    
    func testPhoto() {
        let storyboard = Storyboard(name: "Photo", data: PhotoStoryboardTestData)
        
        XCTAssertEqual(storyboard?.name, "Photo")
        XCTAssertEqual(storyboard?.initialViewControllerIdentifier, "BpT-OW-KyL")
        
        XCTAssertEqual(storyboard?.viewControllers.count, 3)
    }
    
}
