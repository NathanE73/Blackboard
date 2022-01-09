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

class StringExtensionsTests: XCTestCase {
    
    func testFirstCharacterLowercased() {
        XCTAssertEqual("".firstCharacterLowercased, "")
        
        XCTAssertEqual("Apple".firstCharacterLowercased, "apple")
        XCTAssertEqual("AppleApple".firstCharacterLowercased, "appleApple")
        XCTAssertEqual("ABC".firstCharacterLowercased, "aBC")
        
        XCTAssertEqual(" Apple".firstCharacterLowercased, " Apple")
        XCTAssertEqual(" ABC".firstCharacterLowercased, " ABC")
    }
    
    func testFirstCharacterUppercased() {
        XCTAssertEqual("".firstCharacterUppercased, "")
        
        XCTAssertEqual("apple".firstCharacterUppercased, "Apple")
        XCTAssertEqual("appleApple".firstCharacterUppercased, "AppleApple")
        XCTAssertEqual("abc".firstCharacterUppercased, "Abc")
        
        XCTAssertEqual(" Apple".firstCharacterUppercased, " Apple")
        XCTAssertEqual(" ABC".firstCharacterUppercased, " ABC")
    }
    
    func testRemovingSuffix() {
        XCTAssertEqual("".removingSuffix("Cell"), "")
        
        XCTAssertEqual("AppleTableViewCell".removingSuffix("Cell"), "AppleTableView")
        XCTAssertEqual("AppleTableViewCell".removingSuffix("TableViewCell"), "Apple")
        
        XCTAssertEqual("AppleApple".removingSuffix("APPLE"), "AppleApple")
    }
    
    func testStartsWithDecimalDigit() {
        XCTAssertFalse("apple".startsWithDecimalDigit)
        
        XCTAssertTrue("1.infinite.loop".startsWithDecimalDigit)
        XCTAssertTrue("2.infinite.loop".startsWithDecimalDigit)
        XCTAssertTrue("3.infinite.loop".startsWithDecimalDigit)
        XCTAssertTrue("4.infinite.loop".startsWithDecimalDigit)
        XCTAssertTrue("5.infinite.loop".startsWithDecimalDigit)
        XCTAssertTrue("6.infinite.loop".startsWithDecimalDigit)
        XCTAssertTrue("7.infinite.loop".startsWithDecimalDigit)
        XCTAssertTrue("8.infinite.loop".startsWithDecimalDigit)
        XCTAssertTrue("9.infinite.loop".startsWithDecimalDigit)
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
    
    // MARK: - NSString
    
    func testLastPathComponent() {
        // Given
        let text = "./Documents/Images/Profile.png"
        
        // When
        let result = text.lastPathComponent
        
        // Then
        XCTAssertEqual(result, "Profile.png")
    }
    
    func testDeletingLastPathComponent() {
        // Given
        let text = "./Documents/Images/Profile.png"
        
        // When
        let result = text.deletingLastPathComponent
        
        // Then
        XCTAssertEqual(result, "./Documents/Images")
    }
    
    func testAppendingPathComponent() {
        // Given
        let text = "./Documents/Images"
        
        // When
        let result = text.appendingPathComponent("friends")
        
        // Then
        XCTAssertEqual(result, "./Documents/Images/friends")
    }
    
    func testPathExtension() {
        // Given
        let text = "./Documents/Images/Profile.png"
        
        // When
        let result = text.pathExtension
        
        // Then
        XCTAssertEqual(result, "png")
    }
    
    func testDeletingPathExtension() {
        // Given
        let text = "./Documents/Images/Profile.png"
        
        // When
        let result = text.deletingPathExtension
        
        // Then
        XCTAssertEqual(result, "./Documents/Images/Profile")
    }
    
    func testAppendingPathExtension() {
        // Given
        let text = "./Documents/Images/Profile"
        
        // When
        let result = text.appendingPathExtension("jpg")
        
        // Then
        XCTAssertEqual(result, "./Documents/Images/Profile.jpg")
    }
    
    func testExpandingTildeInPath() {
        // Given
        let text = "~/.."
        
        // When
        let result = (text.expandingTildeInPath as NSString).standardizingPath
        
        // Then
        XCTAssertEqual(result, "/Users")
    }
    
}
