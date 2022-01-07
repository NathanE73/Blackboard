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

class SymbolAvailabilityTests: XCTestCase {
    
    func testResource() throws {
        let availability = try XCTUnwrap(SymbolAvailability.resource)
        
        XCTAssertEqual(availability.symbols.count, 3_771)
        
        XCTAssertEqual(availability.symbols["14.square.fill"], "2019")
        XCTAssertEqual(availability.symbols["case"], "2020")
        XCTAssertEqual(availability.symbols["case.fill"], "2020")
        XCTAssertEqual(availability.symbols["chevron.down"], "2019")
        XCTAssertEqual(availability.symbols["chevron.up"], "2019")
        XCTAssertEqual(availability.symbols["die.face.1"], "2020")
        XCTAssertEqual(availability.symbols["die.face.4"], "2020")
        XCTAssertEqual(availability.symbols["infinity.circle.fill"], "2020.1")
        XCTAssertEqual(availability.symbols["minus.circle.fill"], "2019")
        XCTAssertEqual(availability.symbols["person"], "2019")
        XCTAssertEqual(availability.symbols["person.2"], "2019")
        XCTAssertEqual(availability.symbols["plus.circle.fill"], "2019")
        XCTAssertEqual(availability.symbols["return"], "2019")
        XCTAssertEqual(availability.symbols["repeat"], "2019")
        XCTAssertEqual(availability.symbols["repeat.circle"], "2020.1")
        
        XCTAssertEqual(availability.yearToRelease.count, 7)
        XCTAssertEqual(availability.yearToRelease["2019"]?.iOS, Version(13, 0))
        XCTAssertEqual(availability.yearToRelease["2020"]?.iOS, Version(14, 0))
        XCTAssertEqual(availability.yearToRelease["2020.1"]?.iOS, Version(14, 2))
        XCTAssertEqual(availability.yearToRelease["2020.2"]?.iOS, Version(14, 5))
        XCTAssertEqual(availability.yearToRelease["2021"]?.iOS, Version(15, 0))
        XCTAssertEqual(availability.yearToRelease["2021.1"]?.iOS, Version(15, 1))
        XCTAssertEqual(availability.yearToRelease["2021.2"]?.iOS, Version(15, 2))
    }
    
}
