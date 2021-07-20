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

class NamingTests: XCTestCase {
    
    func testMemberNameFromIdentifier() {
        XCTAssertEqual(Naming.memberName(fromIdentifier: "ApplePie"), "ApplePie")
        
        XCTAssertEqual(Naming.memberName(fromIdentifier: "apple pie"), "ApplePie")
        
        XCTAssertEqual(Naming.memberName(fromIdentifier: "apple.pie"), "ApplePie")
        XCTAssertEqual(Naming.memberName(fromIdentifier: "apple-pie"), "ApplePie")
        XCTAssertEqual(Naming.memberName(fromIdentifier: "apple_pie"), "ApplePie")
        
        XCTAssertEqual(Naming.memberName(fromIdentifier: "apple->pie"), "ApplePie")
        
        XCTAssertEqual(Naming.memberName(fromIdentifier: "Fluorescent/Radical Red"), "FluorescentRadicalRed")
        XCTAssertEqual(Naming.memberName(fromIdentifier: "One/Two/Three/Blue"), "OneTwoThreeBlue")
    }
    
    func testMethodNameFromIdentifier() {
        XCTAssertEqual(Naming.methodName(fromIdentifier: "ApplePie"), "applePie")
        
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple pie"), "applePie")
        
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple.pie"), "applePie")
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple-pie"), "applePie")
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple_pie"), "applePie")
        
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple->pie"), "applePie")
        
        XCTAssertEqual(Naming.methodName(fromIdentifier: "Fluorescent/Radical Red"), "fluorescentRadicalRed")
        XCTAssertEqual(Naming.methodName(fromIdentifier: "One/Two/Three/Blue"), "oneTwoThreeBlue")
        
        XCTAssertEqual(Naming.methodName(fromIdentifier: "1.infinite.loop"), "number1InfiniteLoop")
    }
    
    func testNameFromIdentifier() {
        XCTAssertEqual(Naming.name(fromIdentifier: "ApplePie"), "ApplePie")
        
        XCTAssertEqual(Naming.name(fromIdentifier: "apple pie"), "ApplePie")
        
        XCTAssertEqual(Naming.name(fromIdentifier: "apple.pie"), "ApplePie")
        XCTAssertEqual(Naming.name(fromIdentifier: "apple-pie"), "ApplePie")
        XCTAssertEqual(Naming.name(fromIdentifier: "apple_pie"), "ApplePie")
        
        XCTAssertEqual(Naming.name(fromIdentifier: "apple->pie"), "ApplePie")
        
        XCTAssertEqual(Naming.name(fromIdentifier: "Fluorescent/Radical Red"), "FluorescentRadicalRed")
        XCTAssertEqual(Naming.name(fromIdentifier: "One/Two/Three/Blue"), "OneTwoThreeBlue")
    }
    
    func testNamespace() {
        XCTAssertEqual(Naming.namespace(from: nil, "Absolute Zero"), "Absolute Zero")
        
        XCTAssertEqual(Naming.namespace(from: "Fluorescent", "Radical Red"), "Fluorescent/Radical Red")
    }
    
    func testSymbolCaseName() {
        XCTAssertEqual(Naming.symbolCaseName(from: "14.square.fill"), "number14SquareFill")
        XCTAssertEqual(Naming.symbolCaseName(from: "case"), "case")
        XCTAssertEqual(Naming.symbolCaseName(from: "case.fill"), "caseFill")
        XCTAssertEqual(Naming.symbolCaseName(from: "chevron.down"), "chevronDown")
        XCTAssertEqual(Naming.symbolCaseName(from: "chevron.up"), "chevronUp")
        XCTAssertEqual(Naming.symbolCaseName(from: "die.face.1"), "dieFace1")
        XCTAssertEqual(Naming.symbolCaseName(from: "die.face.4"), "dieFace4")
        XCTAssertEqual(Naming.symbolCaseName(from: "infinity.circle.fill"), "infinityCircleFill")
        XCTAssertEqual(Naming.symbolCaseName(from: "minus.circle.fill"), "minusCircleFill")
        XCTAssertEqual(Naming.symbolCaseName(from: "person"), "person")
        XCTAssertEqual(Naming.symbolCaseName(from: "person2"), "person2")
        XCTAssertEqual(Naming.symbolCaseName(from: "plus.circle.fill"), "plusCircleFill")
        XCTAssertEqual(Naming.symbolCaseName(from: "return"), "return")
        XCTAssertEqual(Naming.symbolCaseName(from: "repeat"), "repeat")
        XCTAssertEqual(Naming.symbolCaseName(from: "repeat.circle"), "repeatCircle")
    }
    
    func testSymbolMethodName() {
        XCTAssertEqual(Naming.symbolMethodName(from: "14.square.fill"), "symbolNumber14SquareFill")
        XCTAssertEqual(Naming.symbolMethodName(from: "case"), "symbolCase")
        XCTAssertEqual(Naming.symbolMethodName(from: "case.fill"), "symbolCaseFill")
        XCTAssertEqual(Naming.symbolMethodName(from: "chevron.down"), "symbolChevronDown")
        XCTAssertEqual(Naming.symbolMethodName(from: "chevron.up"), "symbolChevronUp")
        XCTAssertEqual(Naming.symbolMethodName(from: "die.face.1"), "symbolDieFace1")
        XCTAssertEqual(Naming.symbolMethodName(from: "die.face.4"), "symbolDieFace4")
        XCTAssertEqual(Naming.symbolMethodName(from: "infinity.circle.fill"), "symbolInfinityCircleFill")
        XCTAssertEqual(Naming.symbolMethodName(from: "minus.circle.fill"), "symbolMinusCircleFill")
        XCTAssertEqual(Naming.symbolMethodName(from: "person"), "symbolPerson")
        XCTAssertEqual(Naming.symbolMethodName(from: "person2"), "symbolPerson2")
        XCTAssertEqual(Naming.symbolMethodName(from: "plus.circle.fill"), "symbolPlusCircleFill")
        XCTAssertEqual(Naming.symbolMethodName(from: "return"), "symbolReturn")
        XCTAssertEqual(Naming.symbolMethodName(from: "repeat"), "symbolRepeat")
        XCTAssertEqual(Naming.symbolMethodName(from: "repeat.circle"), "symbolRepeatCircle")
    }
    
}
