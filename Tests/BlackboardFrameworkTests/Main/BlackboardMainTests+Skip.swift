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

extension BlackboardMainTests {
    // MARK: - Skip Colors Tests

    func testCommandSkipColors() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipColors = true

        let configuration = BlackboardConfiguration()

        let main = try BlackboardMain(command, configuration)

        XCTAssertTrue(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testConfigurationSkipColors() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(skips: [.colors])

        let main = try BlackboardMain(command, configuration)

        XCTAssertTrue(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testBothSkipColors() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipColors = true

        let configuration = BlackboardConfiguration(skips: [.colors])

        let main = try BlackboardMain(command, configuration)

        XCTAssertTrue(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    // MARK: - Skip Data Assets Tests

    func testCommandSkipDataAssets() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipDataAssets = true

        let configuration = BlackboardConfiguration()

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertTrue(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testConfigurationSkipDataAssets() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(skips: [.dataAssets])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertTrue(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testBothSkipDataAssets() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipDataAssets = true

        let configuration = BlackboardConfiguration(skips: [.dataAssets])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertTrue(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    // MARK: - Skip Images Tests

    func testCommandSkipImages() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipImages = true

        let configuration = BlackboardConfiguration()

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertTrue(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testConfigurationSkipImages() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(skips: [.images])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertTrue(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testBothSkipImages() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipImages = true

        let configuration = BlackboardConfiguration(skips: [.images])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertTrue(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    // MARK: - Skip SwiftUI Tests

    func testCommandSkipSwiftUI() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipSwiftUI = true

        let configuration = BlackboardConfiguration()

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertTrue(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testConfigurationSkipSwiftUI() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(skips: [.swiftui])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertTrue(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testBothSkipSwiftUI() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipSwiftUI = true

        let configuration = BlackboardConfiguration(skips: [.swiftui])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertTrue(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    // MARK: - Skip Symbols Tests

    func testCommandSkipSymbols() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipSymbols = true

        let configuration = BlackboardConfiguration()

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertTrue(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testConfigurationSkipSymbols() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(skips: [.symbols])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertTrue(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testBothSkipSymbols() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipSymbols = true

        let configuration = BlackboardConfiguration(skips: [.symbols])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertTrue(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    // MARK: - Skip UIKit Tests

    func testCommandSkipUIKit() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipUIKit = true

        let configuration = BlackboardConfiguration()

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertTrue(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testConfigurationSkipUIKit() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(skips: [.uikit])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertTrue(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    func testBothSkipUIKit() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipUIKit = true

        let configuration = BlackboardConfiguration(skips: [.uikit])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertTrue(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    // MARK: - Skip UIKit Colors Tests

    func testConfigurationSkipUIKitColors() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(skips: [.uikitColors])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertTrue(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    // MARK: - Skip UIKit Images Tests

    func testConfigurationSkipUIKitImages() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(skips: [.uikitImages])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertTrue(main.skipUIKitImages)
        XCTAssertFalse(main.skipUIKitSymbols)
    }

    // MARK: - Skip UIKit Symbols Tests

    func testConfigurationSkipUIKitSymbols() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(skips: [.uikitSymbols])

        let main = try BlackboardMain(command, configuration)

        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipUIKitColors)
        XCTAssertFalse(main.skipUIKitImages)
        XCTAssertTrue(main.skipUIKitSymbols)
    }
}
