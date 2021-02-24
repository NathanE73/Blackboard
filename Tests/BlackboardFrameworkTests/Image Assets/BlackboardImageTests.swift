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

class BlackboardImageTests: XCTestCase {
    
    func testButton() {
        guard let imageSet = Fixture.imageSet(project: .shared, name: "button") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "button")
        XCTAssertEqual(blackboardImage.functionName, "button")
        XCTAssertEqual(blackboardImage.caseName, "button")
    }
    
    func testGreenPaperClip() {
        guard let imageSet = Fixture.imageSet(project: .shared, path: "Paper Clips", name: "green-paper-clip") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "green-paper-clip")
        XCTAssertEqual(blackboardImage.functionName, "greenPaperClip")
        XCTAssertEqual(blackboardImage.caseName, "greenPaperClip")
    }
    
    func testGreenPencil() {
        guard let imageSet = Fixture.imageSet(project: .shared, name: "green-pencil") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "green-pencil")
        XCTAssertEqual(blackboardImage.functionName, "greenPencil")
        XCTAssertEqual(blackboardImage.caseName, "greenPencil")
    }
    
    func testRedCup() {
        guard let imageSet = Fixture.imageSet(project: .shared, name: "Red/cup") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "Red/cup")
        XCTAssertEqual(blackboardImage.functionName, "redCup")
        XCTAssertEqual(blackboardImage.caseName, "redCup")
    }
    
    func testRedStapler() {
        guard let imageSet = Fixture.imageSet(project: .shared, name: "Red/stapler") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "Red/stapler")
        XCTAssertEqual(blackboardImage.functionName, "redStapler")
        XCTAssertEqual(blackboardImage.caseName, "redStapler")
    }
    
    func testSilverPaperClip() {
        guard let imageSet = Fixture.imageSet(project: .shared, path: "Paper Clips", name: "silver-paper-clip") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "silver-paper-clip")
        XCTAssertEqual(blackboardImage.functionName, "silverPaperClip")
        XCTAssertEqual(blackboardImage.caseName, "silverPaperClip")
    }
    
    func testWhiteDice() {
        guard let imageSet = Fixture.imageSet(project: .shared, name: "white-dice") else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "white-dice")
        XCTAssertEqual(blackboardImage.functionName, "whiteDice")
        XCTAssertEqual(blackboardImage.caseName, "whiteDice")
    }
    
}
