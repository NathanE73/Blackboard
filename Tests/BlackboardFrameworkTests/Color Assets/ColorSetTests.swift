//
// Copyright (c) 2022 Nathan E. Walczak
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

class ColorSetTests: XCTestCase {
    
    func testAbsoluteZero() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "Absolute Zero")
        
        XCTAssertEqual(colorSet.name, "Absolute Zero")
    }
    
    func testBisque() throws {
        let colorSet = try Fixture.colorSet(project: .shared, name: "Bisque")
        
        XCTAssertEqual(colorSet.name, "Bisque")
    }
    
    func testCharcoal() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "Charcoal")
        
        XCTAssertEqual(colorSet.name, "Charcoal")
    }
    
    func testDarkOliveGreen() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "dark-olive-green")
        
        XCTAssertEqual(colorSet.name, "dark-olive-green")
    }
    
    func testDesire() throws {
        let colorSet = try Fixture.colorSet(project: .shared, name: "Desire")
        
        XCTAssertEqual(colorSet.name, "Desire")
    }
    
    func testEmerald() throws {
        let colorSet = try Fixture.colorSet(project: .shared, name: "Emerald")
        
        XCTAssertEqual(colorSet.name, "Emerald")
    }
    
    func testEmpty() throws {
        let colorSet = try Fixture.colorSet(project: .shared, name: "Empty")
        
        XCTAssertEqual(colorSet.name, "Empty")
    }
    
    func testFirebrick() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "firebrick-color")
        
        XCTAssertEqual(colorSet.name, "firebrick-color")
    }
    
    func testMaroon() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "maroon color")
        
        XCTAssertEqual(colorSet.name, "maroon color")
    }
    
    func testNight() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "Night")
        
        XCTAssertEqual(colorSet.name, "Night")
    }
    
}
