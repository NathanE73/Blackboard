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

class BlackboardColorTests: XCTestCase {
    func testAbsoluteZero() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "Absolute Zero")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "Absolute Zero")
        XCTAssertEqual(blackboardColor.propertyName, "absoluteZero")
    }

    func testBisque() throws {
        let colorSet = try Fixture.colorSet(project: .shared, name: "Bisque")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "Bisque")
        XCTAssertEqual(blackboardColor.propertyName, "bisque")
    }

    func testCharcoal() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "Charcoal")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "Charcoal")
        XCTAssertEqual(blackboardColor.propertyName, "charcoal")
    }

    func testDarkOliveGreen() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "dark-olive-green")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "dark-olive-green")
        XCTAssertEqual(blackboardColor.propertyName, "darkOliveGreen")
    }

    func testDesire() throws {
        let colorSet = try Fixture.colorSet(project: .shared, name: "Desire")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "Desire")
        XCTAssertEqual(blackboardColor.propertyName, "desire")
    }

    func testEmerald() throws {
        let colorSet = try Fixture.colorSet(project: .shared, name: "Emerald")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "Emerald")
        XCTAssertEqual(blackboardColor.propertyName, "emerald")
    }

    func testEmpty() throws {
        let colorSet = try Fixture.colorSet(project: .shared, name: "Empty")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "Empty")
        XCTAssertEqual(blackboardColor.propertyName, "empty")
    }

    func testFirebrick() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "firebrick-color")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "firebrick-color")
        XCTAssertEqual(blackboardColor.propertyName, "firebrick")
    }

    func testMaroon() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "maroon color")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "maroon color")
        XCTAssertEqual(blackboardColor.propertyName, "maroon")
    }

    func testNight() throws {
        let colorSet = try Fixture.colorSet(project: .shared, path: "Dark", name: "Night")

        let blackboardColor = BlackboardColor(colorSet)

        XCTAssertEqual(blackboardColor.name, "Night")
        XCTAssertEqual(blackboardColor.propertyName, "night")
    }
}
