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

class FormatSpecifierTests: XCTestCase {
    
    func specifiers(for value: String) -> [FormatSpecifier]? {
        FormatSpecifier.specifiers(for: value)
    }
    
    func testSpecifiers() {
        XCTAssertEqual(specifiers(for: ""), [])
        
        XCTAssertEqual(specifiers(for: "Steve Dave"), [])
        
        XCTAssertEqual(specifiers(for: "%% Steve Dave"), [])
        XCTAssertEqual(specifiers(for: "Steve %% Dave"), [])
        XCTAssertEqual(specifiers(for: "Steve Dave %%"), [])
        
        XCTAssertEqual(specifiers(for: "%% %% Steve Dave"), [])
        XCTAssertEqual(specifiers(for: "Steve %% %% Dave"), [])
        XCTAssertEqual(specifiers(for: "Steve Dave %% %%"), [])
        
        XCTAssertEqual(specifiers(for: "%%%% Steve Dave"), [])
        XCTAssertEqual(specifiers(for: "Steve %%%% Dave"), [])
        XCTAssertEqual(specifiers(for: "Steve Dave %%%%"), [])
        
        XCTAssertEqual(specifiers(for: "%@ Steve Dave"), [.string])
        XCTAssertEqual(specifiers(for: "Steve %@ Dave"), [.string])
        XCTAssertEqual(specifiers(for: "Steve Dave %@"), [.string])
        
        XCTAssertEqual(specifiers(for: "%@ %@ Steve Dave"), [.string, .string])
        XCTAssertEqual(specifiers(for: "Steve %@ %@ Dave"), [.string, .string])
        XCTAssertEqual(specifiers(for: "Steve Dave %@ %@"), [.string, .string])
        
        XCTAssertEqual(specifiers(for: "%@%@ Steve Dave"), [.string, .string])
        XCTAssertEqual(specifiers(for: "Steve %@%@ Dave"), [.string, .string])
        XCTAssertEqual(specifiers(for: "Steve Dave %@%@"), [.string, .string])
        
        XCTAssertEqual(specifiers(for: "%1$@ Steve Dave"), [.string])
        XCTAssertEqual(specifiers(for: "Steve %1$@ Dave"), [.string])
        XCTAssertEqual(specifiers(for: "Steve Dave %1$@"), [.string])
        
        XCTAssertEqual(specifiers(for: "%1$@ %2$@ Steve Dave"), [.string, .string])
        XCTAssertEqual(specifiers(for: "Steve %1$@ %2$@ Dave"), [.string, .string])
        XCTAssertEqual(specifiers(for: "Steve Dave %1$@ %2$@"), [.string, .string])
        
        XCTAssertEqual(specifiers(for: "%1$@%2$@ Steve Dave"), [.string, .string])
        XCTAssertEqual(specifiers(for: "Steve %1$@%2$@ Dave"), [.string, .string])
        XCTAssertEqual(specifiers(for: "Steve Dave %1$@%2$@"), [.string, .string])
        
        XCTAssertEqual(specifiers(for: "%d Steve Dave"), [.other])
        XCTAssertEqual(specifiers(for: "Steve %d Dave"), [.other])
        XCTAssertEqual(specifiers(for: "Steve Dave %d"), [.other])
        
        XCTAssertEqual(specifiers(for: "%d %d Steve Dave"), [.other, .other])
        XCTAssertEqual(specifiers(for: "Steve %d %d Dave"), [.other, .other])
        XCTAssertEqual(specifiers(for: "Steve Dave %d %d"), [.other, .other])
        
        XCTAssertEqual(specifiers(for: "%d%d Steve Dave"), [.other, .other])
        XCTAssertEqual(specifiers(for: "Steve %d%d Dave"), [.other, .other])
        XCTAssertEqual(specifiers(for: "Steve Dave %d%d"), [.other, .other])
        
        XCTAssertEqual(specifiers(for: "%% %d %@"), [.other, .other])
    }
    
}
