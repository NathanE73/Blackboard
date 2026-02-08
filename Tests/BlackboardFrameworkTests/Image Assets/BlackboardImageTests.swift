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

class BlackboardImageTests: XCTestCase {
    func testButton() throws {
        let imageSet = try Fixture.imageSet(project: .shared, name: "button")

        let blackboardImage = BlackboardImage(imageSet)

        XCTAssertEqual(blackboardImage.name, "button")
        XCTAssertEqual(blackboardImage.propertyName, "button")
    }

    func testGreenPaperClip() throws {
        let imageSet = try Fixture.imageSet(project: .shared, path: "Paper Clips", name: "green-paper-clip")

        let blackboardImage = BlackboardImage(imageSet)

        XCTAssertEqual(blackboardImage.name, "green-paper-clip")
        XCTAssertEqual(blackboardImage.propertyName, "greenPaperClip")
    }

    func testGreenPencil() throws {
        let imageSet = try Fixture.imageSet(project: .shared, name: "green-pencil")

        let blackboardImage = BlackboardImage(imageSet)

        XCTAssertEqual(blackboardImage.name, "green-pencil")
        XCTAssertEqual(blackboardImage.propertyName, "greenPencil")
    }

    func testRedCup() throws {
        let imageSet = try Fixture.imageSet(project: .shared, name: "Red/cup")

        let blackboardImage = BlackboardImage(imageSet)

        XCTAssertEqual(blackboardImage.name, "Red/cup")
        XCTAssertEqual(blackboardImage.propertyName, "redCup")
    }

    func testRedStapler() throws {
        let imageSet = try Fixture.imageSet(project: .shared, name: "Red/stapler")

        let blackboardImage = BlackboardImage(imageSet)

        XCTAssertEqual(blackboardImage.name, "Red/stapler")
        XCTAssertEqual(blackboardImage.propertyName, "redStapler")
    }

    func testSilverPaperClip() throws {
        let imageSet = try Fixture.imageSet(project: .shared, path: "Paper Clips", name: "silver-paper-clip")

        let blackboardImage = BlackboardImage(imageSet)

        XCTAssertEqual(blackboardImage.name, "silver-paper-clip")
        XCTAssertEqual(blackboardImage.propertyName, "silverPaperClip")
    }

    func testWhiteDice() throws {
        let imageSet = try Fixture.imageSet(project: .shared, name: "white-dice")

        let blackboardImage = BlackboardImage(imageSet)

        XCTAssertEqual(blackboardImage.name, "white-dice")
        XCTAssertEqual(blackboardImage.propertyName, "whiteDice")
    }
}
