//
// Copyright (c) 2021 Nathan E. Walczak
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

class BlackboardSymbolTests: XCTestCase {
    
    let iOSAvailability = Availability.available(platform: .iOS, version: "13.0")
    
    func testNumber14SquareFill() {
        let blackboardSymbol = BlackboardSymbol(name: "14.square.fill", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "14.square.fill")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolNumber14SquareFill")
        XCTAssertEqual(blackboardSymbol.caseName, "number14SquareFill")
    }
    
    func testCaseSymbol() {
        let blackboardSymbol = BlackboardSymbol(name: "case", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "case")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolCase")
        XCTAssertEqual(blackboardSymbol.caseName, "case")
    }
    
    func testCaseSymbolFill() {
        let blackboardSymbol = BlackboardSymbol(name: "case.fill", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "case.fill")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolCaseFill")
        XCTAssertEqual(blackboardSymbol.caseName, "caseFill")
    }
    
    func testChevronDown() {
        let blackboardSymbol = BlackboardSymbol(name: "chevron.down", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "chevron.down")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolChevronDown")
        XCTAssertEqual(blackboardSymbol.caseName, "chevronDown")
    }
    
    func testChevronUp() {
        let blackboardSymbol = BlackboardSymbol(name: "chevron.up", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "chevron.up")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolChevronUp")
        XCTAssertEqual(blackboardSymbol.caseName, "chevronUp")
    }
    
    func testDieFace1() {
        let blackboardSymbol = BlackboardSymbol(name: "die.face.1", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "die.face.1")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolDieFace1")
        XCTAssertEqual(blackboardSymbol.caseName, "dieFace1")
    }
    
    func testDieFace4() {
        let blackboardSymbol = BlackboardSymbol(name: "die.face.4", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "die.face.4")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolDieFace4")
        XCTAssertEqual(blackboardSymbol.caseName, "dieFace4")
    }
    
    func testInfinityCircleFill() {
        let blackboardSymbol = BlackboardSymbol(name: "infinity.circle.fill", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "infinity.circle.fill")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolInfinityCircleFill")
        XCTAssertEqual(blackboardSymbol.caseName, "infinityCircleFill")
    }
    
    func testMinusCircleFill() {
        let blackboardSymbol = BlackboardSymbol(name: "minus.circle.fill", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "minus.circle.fill")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolMinusCircleFill")
        XCTAssertEqual(blackboardSymbol.caseName, "minusCircleFill")
    }
    
    func testPerson() {
        let blackboardSymbol = BlackboardSymbol(name: "person", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "person")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolPerson")
        XCTAssertEqual(blackboardSymbol.caseName, "person")
    }
    
    func testPerson2() {
        let blackboardSymbol = BlackboardSymbol(name: "person2", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "person2")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolPerson2")
        XCTAssertEqual(blackboardSymbol.caseName, "person2")
    }
    
    func testPlusCircleFill() {
        let blackboardSymbol = BlackboardSymbol(name: "plus.circle.fill", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "plus.circle.fill")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolPlusCircleFill")
        XCTAssertEqual(blackboardSymbol.caseName, "plusCircleFill")
    }
    
    func testReturnSymbol() {
        let blackboardSymbol = BlackboardSymbol(name: "return", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "return")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolReturn")
        XCTAssertEqual(blackboardSymbol.caseName, "return")
    }
    
    func testRepeatSymbol() {
        let blackboardSymbol = BlackboardSymbol(name: "repeat", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "repeat")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolRepeat")
        XCTAssertEqual(blackboardSymbol.caseName, "repeat")
    }
    
    func testRepeatSymbolCircle() {
        let blackboardSymbol = BlackboardSymbol(name: "repeat.circle", iOSAvailability: iOSAvailability)
        
        XCTAssertEqual(blackboardSymbol.name, "repeat.circle")
        XCTAssertEqual(blackboardSymbol.functionName, "symbolRepeatCircle")
        XCTAssertEqual(blackboardSymbol.caseName, "repeatCircle")
    }
    
}
