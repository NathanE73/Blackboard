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

class ImageSetTests: XCTestCase {
    
    let factory = ImageSetFactory()
    
    func testApple() {
        let imageSet = factory.imageSet(name: "Apple", data: AppleImageSetTestData)
        
        XCTAssertEqual(imageSet?.name, "Apple")
    }
    
    func testBigApple() {
        let imageSet = factory.imageSet(name: "big_apple", data: BigAppleImageSetTestData)
        
        XCTAssertEqual(imageSet?.name, "big_apple")
    }
    
    func testEverythingApple() {
        let imageSet = factory.imageSet(name: "everything--apple", data: EverythingAppleImageSetTestData)
        
        XCTAssertEqual(imageSet?.name, "everything--apple")
    }
    
    func testLargeApple() {
        let imageSet = factory.imageSet(name: "large-apple", data: LargeAppleImageSetTestData)
        
        XCTAssertEqual(imageSet?.name, "large-apple")
    }
    
    func testRedApple() {
        let imageSet = factory.imageSet(name: "RedApple", data: RedAppleImageSetTestData)
        
        XCTAssertEqual(imageSet?.name, "RedApple")
    }
    
    func testSmallApple() {
        let imageSet = factory.imageSet(name: "small apple", data: SmallAppleImageSetTestData)
        
        XCTAssertEqual(imageSet?.name, "small apple")
    }
    
    func testTelevision() {
        let imageSet = factory.imageSet(name: "apple television", data: AppleTelevisionImageSetTestData)
        
        XCTAssertNil(imageSet)
    }
    
}
