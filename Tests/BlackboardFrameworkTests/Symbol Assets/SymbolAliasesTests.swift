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

class SymbolAliasesTests: XCTestCase {
    
    func testResource() throws {
        let aliases = try XCTUnwrap(SymbolAliases.resource)
        
        XCTAssertEqual(aliases.symbols.count, 890)
        
        XCTAssertEqual(aliases.symbols["a.book.closed"], "character.book.closed")
        XCTAssertEqual(aliases.symbols["dial.fill"], "dial.low.fill")
    }
    
    func testModernize() throws {
        // Given
        let symbols: Set<String> = [
            "a.book.closed",
            "14.square.fill",
            "character.book.closed",
            "chevron.down",
            "chevron.up"
        ]
        
        // When
        let modernSymbols = SymbolAliases.modernize(symbols: symbols)
        
        // Then
        XCTAssertEqual(modernSymbols, [
            "14.square.fill",
            "character.book.closed", // "a.book.closed"
            "chevron.down",
            "chevron.up"
        ])
    }
    
}
