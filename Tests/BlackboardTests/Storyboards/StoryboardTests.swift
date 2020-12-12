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

@testable import Blackboard

class StoryboardTests: XCTestCase {
    
    func testAccount() {
        let storyboard = Fixture.storyboard(project: .example, name: "Account")
        
        XCTAssertEqual(storyboard?.name, "Account")
        XCTAssertEqual(storyboard?.initialViewControllerIdentifier, "LYS-UF-AgY")
        
        XCTAssertEqual(storyboard?.viewControllers.count, 5)
        
        XCTAssertEqual(storyboard?.namedColorResources, ["Absolute Zero", "Charcoal"])
        XCTAssertEqual(storyboard?.namedImageResources, [])
    }
    
    func testEmpty() {
        let storyboard = Fixture.storyboard(project: .example, name: "Empty")
        
        XCTAssertEqual(storyboard?.name, "Empty")
        XCTAssertNil(storyboard?.initialViewControllerIdentifier)
        
        XCTAssertEqual(storyboard?.viewControllers.count, 0)
        
        XCTAssertEqual(storyboard?.namedColorResources, [])
        XCTAssertEqual(storyboard?.namedImageResources, [])
    }
    
    func testLaunchScreen() {
        let storyboard = Fixture.storyboard(project: .example, name: "LaunchScreen")
        
        XCTAssertNil(storyboard)
    }
    
    func testMain() {
        let storyboard = Fixture.storyboard(project: .example, name: "Main")
        
        XCTAssertEqual(storyboard?.name, "Main")
        XCTAssertEqual(storyboard?.initialViewControllerIdentifier, "BYZ-38-t0r")
        
        XCTAssertEqual(storyboard?.viewControllers.count, 6)
        
        XCTAssertEqual(storyboard?.namedColorResources, ["Bisque", "maroon color"])
        XCTAssertEqual(storyboard?.namedImageResources, [])
    }
    
    func testPhoto() {
        let storyboard = Fixture.storyboard(project: .example, name: "Photo")
        
        XCTAssertEqual(storyboard?.name, "Photo")
        XCTAssertEqual(storyboard?.initialViewControllerIdentifier, "BpT-OW-KyL")
        
        XCTAssertEqual(storyboard?.viewControllers.count, 4)
        
        XCTAssertEqual(storyboard?.namedColorResources, ["Absolute Zero"])
        XCTAssertEqual(storyboard?.namedImageResources, ["Red/stapler"])
    }
    
}
