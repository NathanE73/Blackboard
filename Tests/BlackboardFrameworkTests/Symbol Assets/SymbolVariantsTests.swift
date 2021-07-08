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

class SymbolVariantsTests: XCTestCase {
    
    func testBell() {
        // Given
        let symbols = [
            "bell",
            "bell.fill",
            "bell.circle",
            "bell.circle.fill",
            "bell.square",
            "bell.square.fill",
            "bell.slash",
            "bell.slash.fill",
            "bell.slash.circle",
            "bell.slash.circle.fill"
        ]
        
        var variants = SymbolVariants()
        
        // When
        variants.symbols = symbols.map(SymbolComponents.init)
        
        // Then
        XCTAssertEqual(variants.baseName, "bell")
        XCTAssertEqual(variants.symbols.names, symbols)
    }
    
    func testZero() {
        // Given
        let symbols = [
            "0.circle",
            "0.circle.fill",
            "0.square",
            "0.square.fill"
        ]
        
        var variants = SymbolVariants()
        
        // When
        variants.symbols = symbols.map(SymbolComponents.init)
        
        // Then
        XCTAssertEqual(variants.baseName, "0")
        XCTAssertEqual(variants.symbols.names, symbols)
    }
    
}
