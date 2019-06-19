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

class BlackboardColorTests: XCTestCase {
    
    func testAbsoluteZero() {
        guard let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "Absolute Zero") else {
            XCTFail("Unable to decode color set data")
            return
        }
        
        let blackboardColor = BlackboardColor(colorSet)
        
        XCTAssertEqual(blackboardColor.name, "Absolute Zero")
        XCTAssertEqual(blackboardColor.functionName, "absoluteZero")
        
        XCTAssertEqual(blackboardColor.red, 0)
        XCTAssertEqual(blackboardColor.green, 0.282)
        XCTAssertEqual(blackboardColor.blue, 0.729)
        XCTAssertEqual(blackboardColor.alpha, 1)
    }
    
    func testBisque() {
        guard let colorSet = Fixture.colorSet(project: .example, name: "Bisque") else {
            XCTFail("Unable to decode color set data")
            return
        }
        
        let blackboardColor = BlackboardColor(colorSet)
        
        XCTAssertEqual(blackboardColor.name, "Bisque")
        XCTAssertEqual(blackboardColor.functionName, "bisque")
        
        XCTAssertEqual(blackboardColor.red, 1)
        XCTAssertEqual(blackboardColor.green, 0.894)
        XCTAssertEqual(blackboardColor.blue, 0.769)
        XCTAssertEqual(blackboardColor.alpha, 1)
    }
    
    func testCharcoal() {
        guard let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "Charcoal") else {
            XCTFail("Unable to decode color set data")
            return
        }
        
        let blackboardColor = BlackboardColor(colorSet)
        
        XCTAssertEqual(blackboardColor.name, "Charcoal")
        XCTAssertEqual(blackboardColor.functionName, "charcoal")
        
        XCTAssertEqual(blackboardColor.red, 0.212)
        XCTAssertEqual(blackboardColor.green, 0.271)
        XCTAssertEqual(blackboardColor.blue, 0.310)
        XCTAssertEqual(blackboardColor.alpha, 1)
    }
    
    func testDarkOliveGreen() {
        guard let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "dark-olive-green") else {
            XCTFail("Unable to decode color set data")
            return
        }
        
        let blackboardColor = BlackboardColor(colorSet)
        
        XCTAssertEqual(blackboardColor.name, "dark-olive-green")
        XCTAssertEqual(blackboardColor.functionName, "darkOliveGreen")
        
        XCTAssertEqual(blackboardColor.red, 0.333)
        XCTAssertEqual(blackboardColor.green, 0.420)
        XCTAssertEqual(blackboardColor.blue, 0.184)
        XCTAssertEqual(blackboardColor.alpha, 1)
    }
    
    func testDesire() {
        guard let colorSet = Fixture.colorSet(project: .example, name: "Desire") else {
            XCTFail("Unable to decode color set data")
            return
        }
        
        let blackboardColor = BlackboardColor(colorSet)
        
        XCTAssertEqual(blackboardColor.name, "Desire")
        XCTAssertEqual(blackboardColor.functionName, "desire")
        
        XCTAssertEqual(blackboardColor.red, 0.9176470588235294)
        XCTAssertEqual(blackboardColor.green, 0.23529411764705882)
        XCTAssertEqual(blackboardColor.blue, 0.3254901960784314)
        XCTAssertEqual(blackboardColor.alpha, 1)
    }
    
    func testEmerald() {
        guard let colorSet = Fixture.colorSet(project: .example, name: "Emerald") else {
            XCTFail("Unable to decode color set data")
            return
        }
        
        let blackboardColor = BlackboardColor(colorSet)
        
        XCTAssertEqual(blackboardColor.name, "Emerald")
        XCTAssertEqual(blackboardColor.functionName, "emerald")
        
        XCTAssertEqual(blackboardColor.red, 0.3137254901960784)
        XCTAssertEqual(blackboardColor.green, 0.7843137254901961)
        XCTAssertEqual(blackboardColor.blue, 0.47058823529411764)
        XCTAssertEqual(blackboardColor.alpha, 1)
    }
    
    func testEmpty() {
        let colorSet = Fixture.colorSet(project: .example, name: "Empty")
        
        XCTAssertNil(colorSet)
    }
    
    func testFirebrick() {
        guard let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "firebrick-color") else {
            XCTFail("Unable to decode color set data")
            return
        }
        
        let blackboardColor = BlackboardColor(colorSet)
        
        XCTAssertEqual(blackboardColor.functionName, "firebrick")
        XCTAssertEqual(blackboardColor.name, "firebrick-color")
        
        XCTAssertEqual(blackboardColor.red, 0.698)
        XCTAssertEqual(blackboardColor.green, 0.133)
        XCTAssertEqual(blackboardColor.blue, 0.133)
        XCTAssertEqual(blackboardColor.alpha, 1)
    }
    
    func testMaroon() {
        guard let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "maroon color") else {
            XCTFail("Unable to decode color set data")
            return
        }
        
        let blackboardColor = BlackboardColor(colorSet)
        
        XCTAssertEqual(blackboardColor.functionName, "maroon")
        XCTAssertEqual(blackboardColor.name, "maroon color")
        
        XCTAssertEqual(blackboardColor.red, 0.502)
        XCTAssertEqual(blackboardColor.green, 0)
        XCTAssertEqual(blackboardColor.blue, 0)
        XCTAssertEqual(blackboardColor.alpha, 1)
    }
    
    func testNight() {
        guard let colorSet = Fixture.colorSet(project: .example, path: "Dark", name: "Night") else {
            XCTFail("Unable to decode color set data")
            return
        }
        
        let blackboardColor = BlackboardColor(colorSet)
        
        XCTAssertEqual(blackboardColor.functionName, "night")
        XCTAssertEqual(blackboardColor.name, "Night")
        
        XCTAssertEqual(blackboardColor.red, 0.050)
        XCTAssertEqual(blackboardColor.green, 0.050)
        XCTAssertEqual(blackboardColor.blue, 0.050)
        XCTAssertEqual(blackboardColor.alpha, 0.475)
    }
    
}
