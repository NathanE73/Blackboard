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

class BlackboardDataTests: XCTestCase {
    
    func testLevel001() {
        guard let dataSet = Fixture.dataSet(project: .example, name: "Level/001") else {
            XCTFail("Unable to decode image set data")
            return
        }

        let blackboardData = BlackboardData(dataSet)
        
        XCTAssertEqual(blackboardData.name, "Level/001")
        XCTAssertEqual(blackboardData.caseName, "level001")
    }
    
    func testLevel002() {
        guard let dataSet = Fixture.dataSet(project: .example, name: "Level/002") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardData = BlackboardData(dataSet)
        
        XCTAssertEqual(blackboardData.name, "Level/002")
        XCTAssertEqual(blackboardData.caseName, "level002")
    }
    
    func testNames() {
        guard let dataSet = Fixture.dataSet(project: .example, name: "Names") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardData = BlackboardData(dataSet)
        
        XCTAssertEqual(blackboardData.name, "Names")
        XCTAssertEqual(blackboardData.caseName, "names")
    }
    
    func testWelcomeMessage() {
        guard let dataSet = Fixture.dataSet(project: .example, name: "Welcome Message") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardData = BlackboardData(dataSet)
        
        XCTAssertEqual(blackboardData.name, "Welcome Message")
        XCTAssertEqual(blackboardData.caseName, "welcomeMessage")
    }
    
}
