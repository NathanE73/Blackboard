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

class SymbolComponentsTests: XCTestCase {
    
    func testEverything() throws {
        // Given
        let components = SymbolComponents(name: "speaker.slash.circle.fill.rtl")
        
        // Then
        XCTAssertEqual(components.baseName, "speaker")
        XCTAssertEqual(components.isSlashed, true)
        XCTAssertEqual(components.shape, .circle)
        XCTAssertEqual(components.isFilled, true)
        XCTAssertEqual(components.locale, .rtl)
    }
    
    func testWithoutSlash() throws {
        // Given
        let components = SymbolComponents(name: "speaker.circle.fill.rtl")
        
        // Then
        XCTAssertEqual(components.baseName, "speaker")
        XCTAssertEqual(components.isSlashed, false)
        XCTAssertEqual(components.shape, .circle)
        XCTAssertEqual(components.isFilled, true)
        XCTAssertEqual(components.locale, .rtl)
    }
    
    func testWithoutShape() throws {
        // Given
        let components = SymbolComponents(name: "speaker.slash.fill.rtl")
        
        // Then
        XCTAssertEqual(components.baseName, "speaker")
        XCTAssertEqual(components.isSlashed, true)
        XCTAssertEqual(components.shape, nil)
        XCTAssertEqual(components.isFilled, true)
        XCTAssertEqual(components.locale, .rtl)
    }
    
    func testWithoutFill() throws {
        // Given
        let components = SymbolComponents(name: "speaker.slash.circle.rtl")
        
        // Then
        XCTAssertEqual(components.baseName, "speaker")
        XCTAssertEqual(components.isSlashed, true)
        XCTAssertEqual(components.shape, .circle)
        XCTAssertEqual(components.isFilled, false)
        XCTAssertEqual(components.locale, .rtl)
    }
    
    func testWithoutLocale() throws {
        // Given
        let components = SymbolComponents(name: "speaker.slash.circle")
        
        // Then
        XCTAssertEqual(components.baseName, "speaker")
        XCTAssertEqual(components.isSlashed, true)
        XCTAssertEqual(components.shape, .circle)
        XCTAssertEqual(components.isFilled, false)
        XCTAssertEqual(components.locale, nil)
    }
    
    func testSorted() {
        // Given
        let symbols = [
            "something",
            "something.ar",
            "something.he",
            "something.hi",
            "something.ja",
            "something.ko",
            "something.rtl",
            "something.th",
            "something.zh",
            "something.zh.traditional",
            
            "something.fill",
            "something.fill.ar",
            "something.fill.he",
            "something.fill.hi",
            "something.fill.ja",
            "something.fill.ko",
            "something.fill.rtl",
            "something.fill.th",
            "something.fill.zh",
            "something.fill.zh.traditional",
            
            "something.circle",
            "something.circle.ar",
            "something.circle.he",
            "something.circle.hi",
            "something.circle.ja",
            "something.circle.ko",
            "something.circle.rtl",
            "something.circle.th",
            "something.circle.zh",
            "something.circle.zh.traditional",
            
            "something.circle.fill",
            "something.circle.fill.ar",
            "something.circle.fill.he",
            "something.circle.fill.hi",
            "something.circle.fill.ja",
            "something.circle.fill.ko",
            "something.circle.fill.rtl",
            "something.circle.fill.th",
            "something.circle.fill.zh",
            "something.circle.fill.zh.traditional",
            
            "something.rectangle",
            "something.rectangle.ar",
            "something.rectangle.he",
            "something.rectangle.hi",
            "something.rectangle.ja",
            "something.rectangle.ko",
            "something.rectangle.rtl",
            "something.rectangle.th",
            "something.rectangle.zh",
            "something.rectangle.zh.traditional",
            
            "something.rectangle.fill",
            "something.rectangle.fill.ar",
            "something.rectangle.fill.he",
            "something.rectangle.fill.hi",
            "something.rectangle.fill.ja",
            "something.rectangle.fill.ko",
            "something.rectangle.fill.rtl",
            "something.rectangle.fill.th",
            "something.rectangle.fill.zh",
            "something.rectangle.fill.zh.traditional",
            
            "something.square",
            "something.square.ar",
            "something.square.he",
            "something.square.hi",
            "something.square.ja",
            "something.square.ko",
            "something.square.rtl",
            "something.square.th",
            "something.square.zh",
            "something.square.zh.traditional",
            
            "something.square.fill",
            "something.square.fill.ar",
            "something.square.fill.he",
            "something.square.fill.hi",
            "something.square.fill.ja",
            "something.square.fill.ko",
            "something.square.fill.rtl",
            "something.square.fill.th",
            "something.square.fill.zh",
            "something.square.fill.zh.traditional",
            
            "something.slash",
            "something.slash.ar",
            "something.slash.he",
            "something.slash.hi",
            "something.slash.ja",
            "something.slash.ko",
            "something.slash.rtl",
            "something.slash.th",
            "something.slash.zh",
            "something.slash.zh.traditional",
            
            "something.slash.fill",
            "something.slash.fill.ar",
            "something.slash.fill.he",
            "something.slash.fill.hi",
            "something.slash.fill.ja",
            "something.slash.fill.ko",
            "something.slash.fill.rtl",
            "something.slash.fill.th",
            "something.slash.fill.zh",
            "something.slash.fill.zh.traditional",
            
            "something.slash.circle",
            "something.slash.circle.ar",
            "something.slash.circle.he",
            "something.slash.circle.hi",
            "something.slash.circle.ja",
            "something.slash.circle.ko",
            "something.slash.circle.rtl",
            "something.slash.circle.th",
            "something.slash.circle.zh",
            "something.slash.circle.zh.traditional",
            
            "something.slash.circle.fill",
            "something.slash.circle.fill.ar",
            "something.slash.circle.fill.he",
            "something.slash.circle.fill.hi",
            "something.slash.circle.fill.ja",
            "something.slash.circle.fill.ko",
            "something.slash.circle.fill.rtl",
            "something.slash.circle.fill.th",
            "something.slash.circle.fill.zh",
            "something.slash.circle.fill.zh.traditional",
            
            "something.slash.rectangle",
            "something.slash.rectangle.ar",
            "something.slash.rectangle.he",
            "something.slash.rectangle.hi",
            "something.slash.rectangle.ja",
            "something.slash.rectangle.ko",
            "something.slash.rectangle.rtl",
            "something.slash.rectangle.th",
            "something.slash.rectangle.zh",
            "something.slash.rectangle.zh.traditional",
            
            "something.slash.rectangle.fill",
            "something.slash.rectangle.fill.ar",
            "something.slash.rectangle.fill.he",
            "something.slash.rectangle.fill.hi",
            "something.slash.rectangle.fill.ja",
            "something.slash.rectangle.fill.ko",
            "something.slash.rectangle.fill.rtl",
            "something.slash.rectangle.fill.th",
            "something.slash.rectangle.fill.zh",
            "something.slash.rectangle.fill.zh.traditional",
            
            "something.slash.square",
            "something.slash.square.ar",
            "something.slash.square.he",
            "something.slash.square.hi",
            "something.slash.square.ja",
            "something.slash.square.ko",
            "something.slash.square.rtl",
            "something.slash.square.th",
            "something.slash.square.zh",
            "something.slash.square.zh.traditional",
            
            "something.slash.square.fill",
            "something.slash.square.fill.ar",
            "something.slash.square.fill.he",
            "something.slash.square.fill.hi",
            "something.slash.square.fill.ja",
            "something.slash.square.fill.ko",
            "something.slash.square.fill.rtl",
            "something.slash.square.fill.th",
            "something.slash.square.fill.zh",
            "something.slash.square.fill.zh.traditional"
        ]
        
        // When
        let variants = Set(symbols).map(SymbolComponents.init)
        
        // Then
        XCTAssertEqual(variants.sorted().names, symbols)
    }
    
}
