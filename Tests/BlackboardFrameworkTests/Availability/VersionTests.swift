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

@testable import BlackboardFramework
import XCTest

class VersionTests: XCTestCase {
    func testDescription() {
        XCTAssertEqual(Version(13).description, "13")
        XCTAssertEqual(Version(13, 1).description, "13.1")
        XCTAssertEqual(Version(13, 1, 2).description, "13.1.2")

        XCTAssertEqual(Version(13, 0).description, "13.0")
        XCTAssertEqual(Version(13, 0, 0).description, "13.0.0")
    }

    func testInitWithString() {
        XCTAssertEqual(Version("13")?.description, "13")
        XCTAssertEqual(Version("13.1")?.description, "13.1")
        XCTAssertEqual(Version("13.1.2")?.description, "13.1.2")

        XCTAssertEqual(Version("13.0")?.description, "13.0")
        XCTAssertEqual(Version("13.0.0")?.description, "13.0.0")

        XCTAssertNil(Version(""))

        XCTAssertNil(Version("13.0.0.0"))

        XCTAssertNil(Version("."))
        XCTAssertNil(Version(".."))

        XCTAssertNil(Version(".13"))
        XCTAssertNil(Version("13."))
        XCTAssertNil(Version("13..0"))

        XCTAssertNil(Version("x"))
        XCTAssertNil(Version("13.x"))
        XCTAssertNil(Version("13.0.x"))
    }

    func testDecodable() {
        let json = """
          [
            "12",
            "12.0",
            "12.0.0"
          ]
        """
        let data = Data(json.utf8)

        do {
            let versions = try JSONDecoder().decode([Version].self, from: data)

            XCTAssertEqual(versions.count, 3)
            XCTAssertEqual(versions.first, Version(12))
            XCTAssertEqual(versions.second, Version(12, 0))
            XCTAssertEqual(versions.third, Version(12, 0, 0))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testComparable() {
        XCTAssertLessThanOrEqual(Version(13), Version(14))

        XCTAssertLessThanOrEqual(Version(14), Version(14))

        XCTAssertLessThanOrEqual(Version(14), Version(14, 0))
        XCTAssertLessThanOrEqual(Version(14), Version(14, 0, 0))

        XCTAssertGreaterThanOrEqual(Version(14), Version(14, 0))
        XCTAssertGreaterThanOrEqual(Version(14), Version(14, 0, 0))
    }
}
