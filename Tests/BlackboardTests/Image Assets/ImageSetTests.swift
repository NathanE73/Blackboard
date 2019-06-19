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
    
    func testApple() {
        let imageSet = Fixture.imageSet(project: .example, path: "Apples", name: "Apple")
        
        XCTAssertEqual(imageSet?.name, "Apple")
    }
    
    func testBigApple() {
        let imageSet = Fixture.imageSet(project: .example, path: "Apples", name: "big_apple")
        
        XCTAssertEqual(imageSet?.name, "big_apple")
    }
    
    func testEverythingApple() {
        let imageSet = Fixture.imageSet(project: .example, path: "Apples", name: "everything--apple")
        
        XCTAssertEqual(imageSet?.name, "everything--apple")
    }
    
    func testLargeApple() {
        let imageSet = Fixture.imageSet(project: .example, path: "Apples", name: "large-apple")
        
        XCTAssertEqual(imageSet?.name, "large-apple")
    }
    
    func testRedApple() {
        let imageSet = Fixture.imageSet(project: .example, path: "Apples", name: "RedApple")
        
        XCTAssertEqual(imageSet?.name, "RedApple")
    }
    
    func testSmallApple() {
        let imageSet = Fixture.imageSet(project: .example, path: "Apples", name: "small apple")
        
        XCTAssertEqual(imageSet?.name, "small apple")
    }
    
    func testTelevision() {
        let imageSet = Fixture.imageSet(project: .example, path: "Apples", name: "apple television")
        
        XCTAssertNil(imageSet)
    }
    
}
