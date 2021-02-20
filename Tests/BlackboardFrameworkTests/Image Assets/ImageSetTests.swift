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

class ImageSetTests: XCTestCase {
    
    func testButton() {
        let imageSet = Fixture.imageSet(project: .shared, name: "button")
        
        XCTAssertEqual(imageSet?.name, "button")
    }
    
    func testGreenPaperClip() {
        let imageSet = Fixture.imageSet(project: .shared, path: "Paper Clips", name: "green-paper-clip")
        
        XCTAssertEqual(imageSet?.name, "green-paper-clip")
    }
    
    func testGreenPencil() {
        let imageSet = Fixture.imageSet(project: .shared, name: "green-pencil")
        
        XCTAssertEqual(imageSet?.name, "green-pencil")
    }
    
    func testRedCup() {
        let imageSet = Fixture.imageSet(project: .shared, name: "Red/cup")
        
        XCTAssertEqual(imageSet?.name, "Red/cup")
    }
    
    func testRedStapler() {
        let imageSet = Fixture.imageSet(project: .shared, name: "Red/stapler")
        
        XCTAssertEqual(imageSet?.name, "Red/stapler")
    }
    
    func testSilverPaperClip() {
        let imageSet = Fixture.imageSet(project: .shared, path: "Paper Clips", name: "silver-paper-clip")
        
        XCTAssertEqual(imageSet?.name, "silver-paper-clip")
    }
    
    func testWhiteDice() {
        let imageSet = Fixture.imageSet(project: .shared, name: "white-dice")
        
        XCTAssertEqual(imageSet?.name, "white-dice")
    }
    
}
