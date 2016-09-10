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

class StringExtensionsTests: XCTestCase {
    
    func testlowercasedFirstCharacterString() {
        XCTAssertEqual("".lowercasedFirstCharacterString, "")
        
        XCTAssertEqual("Apple".lowercasedFirstCharacterString, "apple")
        XCTAssertEqual("AppleApple".lowercasedFirstCharacterString, "appleApple")
        XCTAssertEqual("ABC".lowercasedFirstCharacterString, "aBC")
        
        XCTAssertEqual(" Apple".lowercasedFirstCharacterString, " Apple")
        XCTAssertEqual(" ABC".lowercasedFirstCharacterString, " ABC")
    }
    
    func testStringByRemovingSuffixString() {
        XCTAssertEqual("".stringByRemovingSuffixString("Cell"), "")
        
        XCTAssertEqual("AppleTableViewCell".stringByRemovingSuffixString("Cell"), "AppleTableView")
        XCTAssertEqual("AppleTableViewCell".stringByRemovingSuffixString("TableViewCell"), "Apple")
        
        XCTAssertEqual("AppleApple".stringByRemovingSuffixString("APPLE"), "AppleApple")
    }
    
    func testTrimmingWhitespaceCharacters() {
        XCTAssertEqual("".trimmingWhitespaceCharacters, "")
        
        XCTAssertEqual("apple".trimmingWhitespaceCharacters, "apple")
        
        XCTAssertEqual(" apple".trimmingWhitespaceCharacters, "apple")
        XCTAssertEqual("  apple".trimmingWhitespaceCharacters, "apple")
        XCTAssertEqual("   apple".trimmingWhitespaceCharacters, "apple")
        
        XCTAssertEqual("apple ".trimmingWhitespaceCharacters, "apple")
        XCTAssertEqual("apple  ".trimmingWhitespaceCharacters, "apple")
        XCTAssertEqual("apple   ".trimmingWhitespaceCharacters, "apple")
        
        XCTAssertEqual(" apple ".trimmingWhitespaceCharacters, "apple")
        XCTAssertEqual("  apple  ".trimmingWhitespaceCharacters, "apple")
        XCTAssertEqual("   apple   ".trimmingWhitespaceCharacters, "apple")
        
        XCTAssertEqual("\t apple \t".trimmingWhitespaceCharacters, "apple")
    }
    
    // MARK: Identifiers
    
    func testMemberNameFromIdentifier() {
        XCTAssertEqual(memberNameFromIdentifier("ApplePie"), "ApplePie")
        
        XCTAssertEqual(memberNameFromIdentifier("apple pie"), "ApplePie")
        XCTAssertEqual(memberNameFromIdentifier("apple-pie"), "ApplePie")
        XCTAssertEqual(memberNameFromIdentifier("apple_pie"), "ApplePie")
    }
    
    func testMethodNameFromIdentifier() {
        XCTAssertEqual(methodNameFromIdentifier("ApplePie"), "applePie")
        
        XCTAssertEqual(methodNameFromIdentifier("apple pie"), "applePie")
        XCTAssertEqual(methodNameFromIdentifier("apple-pie"), "applePie")
        XCTAssertEqual(methodNameFromIdentifier("apple_pie"), "applePie")
    }
    
    func testMethodNameFromIdentifierWithSuffix() {
        XCTAssertEqual(methodNameFromIdentifier("ApplePie", suffix:"Image"), "applePieImage")
        
        XCTAssertEqual(methodNameFromIdentifier("apple pie", suffix:"Image"), "applePieImage")
        XCTAssertEqual(methodNameFromIdentifier("apple-pie", suffix:"Image"), "applePieImage")
        XCTAssertEqual(methodNameFromIdentifier("apple_pie", suffix:"Image"), "applePieImage")
    }
    
    func testMethodNameFromIdentifierWithSuffixAndPrefix() {
        XCTAssertEqual(methodNameFromIdentifier("ApplePie", suffix:"Image", prefix:"xyz"), "xyzApplePieImage")
        
        XCTAssertEqual(methodNameFromIdentifier("apple pie", suffix:"Image", prefix:"xyz"), "xyzApplePieImage")
        XCTAssertEqual(methodNameFromIdentifier("apple-pie", suffix:"Image", prefix:"xyz"), "xyzApplePieImage")
        XCTAssertEqual(methodNameFromIdentifier("apple_pie", suffix:"Image", prefix:"xyz"), "xyzApplePieImage")
    }
    
}
