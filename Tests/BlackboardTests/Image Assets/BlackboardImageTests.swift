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

class BlackboardImageTests: XCTestCase {
    
    let factory = ImageSetFactory()
    
    func testApple() {
        guard let imageSet = factory.imageSet(name: "Apple", data: AppleImageSetTestData) else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "Apple")
        XCTAssertEqual(blackboardImage.functionName, "apple")
        XCTAssertEqual(blackboardImage.caseName, "apple")
    }
    
    func testBigApple() {
        guard let imageSet = factory.imageSet(name: "big_apple", data: BigAppleImageSetTestData) else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "big_apple")
        XCTAssertEqual(blackboardImage.functionName, "bigApple")
        XCTAssertEqual(blackboardImage.caseName, "bigApple")
    }
    
    func testEverythingApple() {
        guard let imageSet = factory.imageSet(name: "everything--apple", data: EverythingAppleImageSetTestData) else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "everything--apple")
        XCTAssertEqual(blackboardImage.functionName, "everythingApple")
        XCTAssertEqual(blackboardImage.caseName, "everythingApple")
    }
    
    func testLargeApple() {
        guard let imageSet = factory.imageSet(name: "large-apple", data: LargeAppleImageSetTestData) else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "large-apple")
        XCTAssertEqual(blackboardImage.functionName, "largeApple")
        XCTAssertEqual(blackboardImage.caseName, "largeApple")
    }
    
    func testRedApple() {
        guard let imageSet = factory.imageSet(name: "RedApple", data: RedAppleImageSetTestData) else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "RedApple")
        XCTAssertEqual(blackboardImage.functionName, "redApple")
        XCTAssertEqual(blackboardImage.caseName, "redApple")
    }
    
    func testSmallApple() {
        guard let imageSet = factory.imageSet(name: "small apple", data: SmallAppleImageSetTestData) else {
            XCTFail("Unable to decode image set data")
            return
        }
        
        let blackboardImage = BlackboardImage(imageSet)
        
        XCTAssertEqual(blackboardImage.name, "small apple")
        XCTAssertEqual(blackboardImage.functionName, "smallApple")
        XCTAssertEqual(blackboardImage.caseName, "smallApple")
    }
    
    func testTelevision() {
        let imageSet = factory.imageSet(name: "apple television", data: AppleTelevisionImageSetTestData)
        
        XCTAssertNil(imageSet)
    }
    
}
