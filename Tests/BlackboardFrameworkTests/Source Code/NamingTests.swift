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

class NamingTests: XCTestCase {
    
    func testMethodNameFromIdentifier() {
        XCTAssertEqual(Naming.methodName(from: "ApplePie"), "applePie")
        
        XCTAssertEqual(Naming.methodName(from: "apple pie"), "applePie")
        
        XCTAssertEqual(Naming.methodName(from: "apple.pie"), "applePie")
        XCTAssertEqual(Naming.methodName(from: "apple-pie"), "applePie")
        XCTAssertEqual(Naming.methodName(from: "apple_pie"), "applePie")
        
        XCTAssertEqual(Naming.methodName(from: "apple->pie"), "applePie")
        
        XCTAssertEqual(Naming.methodName(from: "APPLE_PIE"), "applePie")
        
        XCTAssertEqual(Naming.methodName(from: "Fluorescent/Radical Red"), "fluorescentRadicalRed")
        XCTAssertEqual(Naming.methodName(from: "One/Two/Three/Blue"), "oneTwoThreeBlue")
        
        XCTAssertEqual(Naming.methodName(from: "1.infinite.loop"), "number1InfiniteLoop")
    }
    
    func testNameFromIdentifier() {
        XCTAssertEqual(Naming.name(from: "ApplePie"), "ApplePie")
        
        XCTAssertEqual(Naming.name(from: "apple pie"), "ApplePie")
        
        XCTAssertEqual(Naming.name(from: "apple.pie"), "ApplePie")
        XCTAssertEqual(Naming.name(from: "apple-pie"), "ApplePie")
        XCTAssertEqual(Naming.name(from: "apple_pie"), "ApplePie")
        
        XCTAssertEqual(Naming.name(from: "apple->pie"), "ApplePie")
        
        XCTAssertEqual(Naming.name(from: "APPLE_PIE"), "ApplePie")
        
        XCTAssertEqual(Naming.name(from: "Fluorescent/Radical Red"), "FluorescentRadicalRed")
        XCTAssertEqual(Naming.name(from: "One/Two/Three/Blue"), "OneTwoThreeBlue")
    }
    
    func testNamespace() {
        XCTAssertEqual(Naming.namespace(from: nil, "Absolute Zero"), "Absolute Zero")
        
        XCTAssertEqual(Naming.namespace(from: "Fluorescent", "Radical Red"), "Fluorescent/Radical Red")
    }
    
    func testSymbolCaseName() {
        XCTAssertEqual(Naming.methodName(from: "14.square.fill"), "number14SquareFill")
        XCTAssertEqual(Naming.methodName(from: "case"), "case")
        XCTAssertEqual(Naming.methodName(from: "case.fill"), "caseFill")
        XCTAssertEqual(Naming.methodName(from: "chevron.down"), "chevronDown")
        XCTAssertEqual(Naming.methodName(from: "chevron.up"), "chevronUp")
        XCTAssertEqual(Naming.methodName(from: "die.face.1"), "dieFace1")
        XCTAssertEqual(Naming.methodName(from: "die.face.4"), "dieFace4")
        XCTAssertEqual(Naming.methodName(from: "infinity.circle.fill"), "infinityCircleFill")
        XCTAssertEqual(Naming.methodName(from: "minus.circle.fill"), "minusCircleFill")
        XCTAssertEqual(Naming.methodName(from: "person"), "person")
        XCTAssertEqual(Naming.methodName(from: "person2"), "person2")
        XCTAssertEqual(Naming.methodName(from: "plus.circle.fill"), "plusCircleFill")
        XCTAssertEqual(Naming.methodName(from: "return"), "return")
        XCTAssertEqual(Naming.methodName(from: "repeat"), "repeat")
        XCTAssertEqual(Naming.methodName(from: "repeat.circle"), "repeatCircle")
    }
    
    func testSymbolMethodName() {
        XCTAssertEqual(Naming.methodName(from: "14.square.fill", prefix: "symbol"), "symbolNumber14SquareFill")
        XCTAssertEqual(Naming.methodName(from: "case", prefix: "symbol"), "symbolCase")
        XCTAssertEqual(Naming.methodName(from: "case.fill", prefix: "symbol"), "symbolCaseFill")
        XCTAssertEqual(Naming.methodName(from: "chevron.down", prefix: "symbol"), "symbolChevronDown")
        XCTAssertEqual(Naming.methodName(from: "chevron.up", prefix: "symbol"), "symbolChevronUp")
        XCTAssertEqual(Naming.methodName(from: "die.face.1", prefix: "symbol"), "symbolDieFace1")
        XCTAssertEqual(Naming.methodName(from: "die.face.4", prefix: "symbol"), "symbolDieFace4")
        XCTAssertEqual(Naming.methodName(from: "infinity.circle.fill", prefix: "symbol"), "symbolInfinityCircleFill")
        XCTAssertEqual(Naming.methodName(from: "minus.circle.fill", prefix: "symbol"), "symbolMinusCircleFill")
        XCTAssertEqual(Naming.methodName(from: "person", prefix: "symbol"), "symbolPerson")
        XCTAssertEqual(Naming.methodName(from: "person2", prefix: "symbol"), "symbolPerson2")
        XCTAssertEqual(Naming.methodName(from: "plus.circle.fill", prefix: "symbol"), "symbolPlusCircleFill")
        XCTAssertEqual(Naming.methodName(from: "return", prefix: "symbol"), "symbolReturn")
        XCTAssertEqual(Naming.methodName(from: "repeat", prefix: "symbol"), "symbolRepeat")
        XCTAssertEqual(Naming.methodName(from: "repeat.circle", prefix: "symbol"), "symbolRepeatCircle")
    }
    
}
