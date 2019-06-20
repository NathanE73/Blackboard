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

class ColorSetTests: XCTestCase {
    
    func testAbsoluteZero() {
        let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "Absolute Zero")
        
        XCTAssertEqual(colorSet?.name, "Absolute Zero")
    }
    
    func testBisque() {
        let colorSet = Fixture.colorSet(project: .example, name: "Bisque")
        
        XCTAssertEqual(colorSet?.name, "Bisque")
    }
    
    func testCharcoal() {
        let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "Charcoal")
        
        XCTAssertEqual(colorSet?.name, "Charcoal")
    }
    
    func testDarkOliveGreen() {
        let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "dark-olive-green")
        
        XCTAssertEqual(colorSet?.name, "dark-olive-green")
    }
    
    func testDesire() {
        let colorSet = Fixture.colorSet(project: .example, name: "Desire")
        
        XCTAssertEqual(colorSet?.name, "Desire")
    }
    
    func testEmerald() {
        let colorSet = Fixture.colorSet(project: .example, name: "Emerald")
        
        XCTAssertEqual(colorSet?.name, "Emerald")
    }
    
    func testEmpty() {
        let colorSet = Fixture.colorSet(project: .example, name: "Empty")
        
        XCTAssertEqual(colorSet?.name, "Empty")
    }
    
    func testFirebrick() {
        let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "firebrick-color")
        
        XCTAssertEqual(colorSet?.name, "firebrick-color")
    }
    
    func testMaroon() {
        let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "maroon color")
        
        XCTAssertEqual(colorSet?.name, "maroon color")
    }
    
    func testNight() {
        let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "Night")
        
        XCTAssertEqual(colorSet?.name, "Night")
    }
    
}
