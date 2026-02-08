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

class DataSetTests: XCTestCase {
    func testLevel001() throws {
        let dataSet = try Fixture.dataSet(project: .shared, name: "Level/N001")

        XCTAssertEqual(dataSet.name, "Level/N001")
    }

    func testLevel002() throws {
        let dataSet = try Fixture.dataSet(project: .shared, name: "Level/N002")

        XCTAssertEqual(dataSet.name, "Level/N002")
    }

    func testNames() throws {
        let dataSet = try Fixture.dataSet(project: .shared, name: "Names")

        XCTAssertEqual(dataSet.name, "Names")
    }

    func testWelcomeMessage() throws {
        let dataSet = try Fixture.dataSet(project: .shared, name: "Welcome Message")

        XCTAssertEqual(dataSet.name, "Welcome Message")
    }
}
