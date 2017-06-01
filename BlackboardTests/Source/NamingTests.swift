//
// Copyright (c) 2016 Nathan E. Walczak
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

class NamingTests: XCTestCase {
    
    func testMemberNameFromIdentifier() {
        XCTAssertEqual(Naming.memberName(fromIdentifier: "ApplePie"), "ApplePie")
        
        XCTAssertEqual(Naming.memberName(fromIdentifier: "apple pie"), "ApplePie")
        XCTAssertEqual(Naming.memberName(fromIdentifier: "apple-pie"), "ApplePie")
        XCTAssertEqual(Naming.memberName(fromIdentifier: "apple_pie"), "ApplePie")
    }
    
    func testMethodNameFromIdentifier() {
        XCTAssertEqual(Naming.methodName(fromIdentifier: "ApplePie"), "applePie")
        
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple pie"), "applePie")
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple-pie"), "applePie")
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple_pie"), "applePie")
    }
    
    func testMethodNameFromIdentifierWithSuffix() {
        XCTAssertEqual(Naming.methodName(fromIdentifier: "ApplePie", suffix: "Image"), "applePieImage")
        
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple pie", suffix: "Image"), "applePieImage")
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple-pie", suffix: "Image"), "applePieImage")
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple_pie", suffix: "Image"), "applePieImage")
    }
    
    func testMethodNameFromIdentifierWithSuffixAndPrefix() {
        XCTAssertEqual(Naming.methodName(fromIdentifier: "ApplePie", suffix: "Image", prefix: "xyz"), "xyzApplePieImage")
        
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple pie", suffix: "Image", prefix: "xyz"), "xyzApplePieImage")
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple-pie", suffix: "Image", prefix: "xyz"), "xyzApplePieImage")
        XCTAssertEqual(Naming.methodName(fromIdentifier: "apple_pie", suffix: "Image", prefix: "xyz"), "xyzApplePieImage")
    }
    
    func testNameFromIdentifier() {
        XCTAssertEqual(Naming.name(fromIdentifier: "ApplePie"), "ApplePie")
        
        XCTAssertEqual(Naming.name(fromIdentifier: "apple pie"), "ApplePie")
        XCTAssertEqual(Naming.name(fromIdentifier: "apple-pie"), "ApplePie")
        XCTAssertEqual(Naming.name(fromIdentifier: "apple_pie"), "ApplePie")
    }
    
}
