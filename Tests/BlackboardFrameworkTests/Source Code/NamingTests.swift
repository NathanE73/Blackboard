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
    
    func testSymbolName() {
        XCTAssertEqual(Naming.symbolName(from: "14.square.fill"), "14.square.fill")
        XCTAssertEqual(Naming.symbolName(from: "case"), "case.symbol")
        XCTAssertEqual(Naming.symbolName(from: "case.fill"), "case.symbol.fill")
        XCTAssertEqual(Naming.symbolName(from: "chevron.down"), "chevron.down")
        XCTAssertEqual(Naming.symbolName(from: "chevron.up"), "chevron.up")
        XCTAssertEqual(Naming.symbolName(from: "die.face.1"), "die.face.1")
        XCTAssertEqual(Naming.symbolName(from: "die.face.4"), "die.face.4")
        XCTAssertEqual(Naming.symbolName(from: "infinity.circle.fill"), "infinity.circle.fill")
        XCTAssertEqual(Naming.symbolName(from: "minus.circle.fill"), "minus.circle.fill")
        XCTAssertEqual(Naming.symbolName(from: "person"), "person")
        XCTAssertEqual(Naming.symbolName(from: "person2"), "person2")
        XCTAssertEqual(Naming.symbolName(from: "plus.circle.fill"), "plus.circle.fill")
        XCTAssertEqual(Naming.symbolName(from: "return"), "return.symbol")
        XCTAssertEqual(Naming.symbolName(from: "repeat"), "repeat.symbol")
        XCTAssertEqual(Naming.symbolName(from: "repeat.circle"), "repeat.symbol.circle")
    }
    
}
