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
        
        XCTAssertEqual(Naming.methodName(from: "1.infinite.loop"), "_1InfiniteLoop")
        XCTAssertEqual(Naming.methodName(from: "1.infinite.loop", numberPrefix: true), "number1InfiniteLoop")
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
    
    func testNamespaceName() {
        XCTAssertEqual(Naming.lastNamespaceName(from: "Radical Red"), "RadicalRed")
        XCTAssertEqual(Naming.lastNamespaceName(from: "Blue"), "Blue")
        XCTAssertEqual(Naming.lastNamespaceName(from: "0"), "_0")
    }
    
    func testLastNamespaceName() {
        XCTAssertEqual(Naming.lastNamespaceName(from: "Fluorescent/Radical Red"), "RadicalRed")
        XCTAssertEqual(Naming.lastNamespaceName(from: "One/Two/Three/Blue"), "Blue")
        XCTAssertEqual(Naming.lastNamespaceName(from: "One/Two/Three/0"), "_0")
    }
    
    func testPropertyPath() {
        XCTAssertEqual(Naming.propertyPath(namespace: nil, propertyName: "absoluteZero"), "absoluteZero")
        XCTAssertEqual(Naming.propertyPath(namespace: "Fluorescent", propertyName: "radicalRed"), "Fluorescent.radicalRed")
        XCTAssertEqual(Naming.propertyPath(namespace: "Alpha/beta", propertyName: "darkRed"), "Alpha.Beta.darkRed")
    }
    
    func testSymbolCaseName() {
        XCTAssertEqual(Naming.methodName(from: "14.square.fill", numberPrefix: true), "number14SquareFill")
        XCTAssertEqual(Naming.methodName(from: "case", numberPrefix: true), "case")
        XCTAssertEqual(Naming.methodName(from: "case.fill", numberPrefix: true), "caseFill")
        XCTAssertEqual(Naming.methodName(from: "chevron.down", numberPrefix: true), "chevronDown")
        XCTAssertEqual(Naming.methodName(from: "chevron.up", numberPrefix: true), "chevronUp")
        XCTAssertEqual(Naming.methodName(from: "die.face.1", numberPrefix: true), "dieFace1")
        XCTAssertEqual(Naming.methodName(from: "die.face.4", numberPrefix: true), "dieFace4")
        XCTAssertEqual(Naming.methodName(from: "infinity.circle.fill", numberPrefix: true), "infinityCircleFill")
        XCTAssertEqual(Naming.methodName(from: "minus.circle.fill", numberPrefix: true), "minusCircleFill")
        XCTAssertEqual(Naming.methodName(from: "person", numberPrefix: true), "person")
        XCTAssertEqual(Naming.methodName(from: "person2", numberPrefix: true), "person2")
        XCTAssertEqual(Naming.methodName(from: "plus.circle.fill", numberPrefix: true), "plusCircleFill")
        XCTAssertEqual(Naming.methodName(from: "return", numberPrefix: true), "return")
        XCTAssertEqual(Naming.methodName(from: "repeat", numberPrefix: true), "repeat")
        XCTAssertEqual(Naming.methodName(from: "repeat.circle", numberPrefix: true), "repeatCircle")
    }
    
    func testSymbolMethodName() {
        XCTAssertEqual(Naming.methodName(from: "14.square.fill", numberPrefix: true, prefix: "symbol"), "symbolNumber14SquareFill")
        XCTAssertEqual(Naming.methodName(from: "case", numberPrefix: true, prefix: "symbol"), "symbolCase")
        XCTAssertEqual(Naming.methodName(from: "case.fill", numberPrefix: true, prefix: "symbol"), "symbolCaseFill")
        XCTAssertEqual(Naming.methodName(from: "chevron.down", numberPrefix: true, prefix: "symbol"), "symbolChevronDown")
        XCTAssertEqual(Naming.methodName(from: "chevron.up", numberPrefix: true, prefix: "symbol"), "symbolChevronUp")
        XCTAssertEqual(Naming.methodName(from: "die.face.1", numberPrefix: true, prefix: "symbol"), "symbolDieFace1")
        XCTAssertEqual(Naming.methodName(from: "die.face.4", numberPrefix: true, prefix: "symbol"), "symbolDieFace4")
        XCTAssertEqual(Naming.methodName(from: "infinity.circle.fill", numberPrefix: true, prefix: "symbol"), "symbolInfinityCircleFill")
        XCTAssertEqual(Naming.methodName(from: "minus.circle.fill", numberPrefix: true, prefix: "symbol"), "symbolMinusCircleFill")
        XCTAssertEqual(Naming.methodName(from: "person", numberPrefix: true, prefix: "symbol"), "symbolPerson")
        XCTAssertEqual(Naming.methodName(from: "person2", numberPrefix: true, prefix: "symbol"), "symbolPerson2")
        XCTAssertEqual(Naming.methodName(from: "plus.circle.fill", numberPrefix: true, prefix: "symbol"), "symbolPlusCircleFill")
        XCTAssertEqual(Naming.methodName(from: "return", numberPrefix: true, prefix: "symbol"), "symbolReturn")
        XCTAssertEqual(Naming.methodName(from: "repeat", numberPrefix: true, prefix: "symbol"), "symbolRepeat")
        XCTAssertEqual(Naming.methodName(from: "repeat.circle", numberPrefix: true, prefix: "symbol"), "symbolRepeatCircle")
    }
    
}
