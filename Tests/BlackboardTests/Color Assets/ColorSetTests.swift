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
    
    let factory = ColorSetFactory()
    
    func testAbsoluteZero() {
        let colorSet = factory.colorSet(name: "Absolute Zero", data: AbsoluteZeroColorSetTestData)
        
        XCTAssertEqual(colorSet?.name, "Absolute Zero")
        
        XCTAssertEqual(colorSet?.red, 0)
        XCTAssertEqual(colorSet?.green, 0.282)
        XCTAssertEqual(colorSet?.blue, 0.729)
        XCTAssertEqual(colorSet?.alpha, 1)
    }
    
    func testBisque() {
        let colorSet = factory.colorSet(name: "Bisque", data: BisqueColorSetTestData)
        
        XCTAssertEqual(colorSet?.name, "Bisque")
        
        XCTAssertEqual(colorSet?.red, 1)
        XCTAssertEqual(colorSet?.green, 0.894)
        XCTAssertEqual(colorSet?.blue, 0.769)
        XCTAssertEqual(colorSet?.alpha, 1)
    }
    
    func testCharcoal() {
        let colorSet = factory.colorSet(name: "Charcoal", data: CharcoalColorSetTestData)
        
        XCTAssertEqual(colorSet?.name, "Charcoal")
        
        XCTAssertEqual(colorSet?.red, 0.212)
        XCTAssertEqual(colorSet?.green, 0.271)
        XCTAssertEqual(colorSet?.blue, 0.310)
        XCTAssertEqual(colorSet?.alpha, 1)
    }
    
    func testDarkOliveGreen() {
        let colorSet = factory.colorSet(name: "dark-olive-green", data: DarkOliveGreenColorSetTestData)
        
        XCTAssertEqual(colorSet?.name, "dark-olive-green")
        
        XCTAssertEqual(colorSet?.red, 0.333)
        XCTAssertEqual(colorSet?.green, 0.420)
        XCTAssertEqual(colorSet?.blue, 0.184)
        XCTAssertEqual(colorSet?.alpha, 1)
    }
    
    func testDesire() {
        let colorSet = factory.colorSet(name: "Desire", data: DesireColorSetTestData)
        
        XCTAssertEqual(colorSet?.name, "Desire")
        
        XCTAssertEqual(colorSet?.red, 0.9176470588235294)
        XCTAssertEqual(colorSet?.green, 0.23529411764705882)
        XCTAssertEqual(colorSet?.blue, 0.3254901960784314)
        XCTAssertEqual(colorSet?.alpha, 1)
    }
    
    func testEmerald() {
        let colorSet = factory.colorSet(name: "Emerald", data: EmeraldColorSetTestData)
        
        XCTAssertEqual(colorSet?.name, "Emerald")
        
        XCTAssertEqual(colorSet?.red, 0.3137254901960784)
        XCTAssertEqual(colorSet?.green, 0.7843137254901961)
        XCTAssertEqual(colorSet?.blue, 0.47058823529411764)
        XCTAssertEqual(colorSet?.alpha, 1)
    }
    
    func testEmpty() {
        let colorSet = factory.colorSet(name: "Empty", data: EmptyColorSetTestData)
        
        XCTAssertNil(colorSet)
    }
    
    func testFirebrick() {
        let colorSet = factory.colorSet(name: "firebrick-color", data: FirebrickColorSetTestData)
        
        XCTAssertEqual(colorSet?.name, "firebrick-color")
        
        XCTAssertEqual(colorSet?.red, 0.698)
        XCTAssertEqual(colorSet?.green, 0.133)
        XCTAssertEqual(colorSet?.blue, 0.133)
        XCTAssertEqual(colorSet?.alpha, 1)
    }
    
    func testMaroon() {
        let colorSet = factory.colorSet(name: "maroon color", data: MaroonColorSetTestData)
        
        XCTAssertEqual(colorSet?.name, "maroon color")
        
        XCTAssertEqual(colorSet?.red, 0.502)
        XCTAssertEqual(colorSet?.green, 0)
        XCTAssertEqual(colorSet?.blue, 0)
        XCTAssertEqual(colorSet?.alpha, 1)
    }
    
    func testNight() {
        let colorSet = factory.colorSet(name: "Night", data: NightColorSetTestData)
        
        XCTAssertEqual(colorSet?.name, "Night")
        
        XCTAssertEqual(colorSet?.red, 0.050)
        XCTAssertEqual(colorSet?.green, 0.050)
        XCTAssertEqual(colorSet?.blue, 0.050)
        XCTAssertEqual(colorSet?.alpha, 0.475)
    }
    
}
