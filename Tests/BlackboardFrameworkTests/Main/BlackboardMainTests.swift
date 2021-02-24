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

class BlackboardMainTests: XCTestCase {
    
    // MARK: - Missing Input
    
    func testMissingInput() throws {
        var command = try BlackboardCommand.parse([])
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration()
        
        do {
            _ = try BlackboardMain(command, configuration)
            XCTFail()
        } catch BlackboardError.missingInput {
            // success
        } catch {
            XCTFail()
        }
    }
    
    // MARK: - Missing Output
    
    func testMissingOutput() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        
        let configuration = BlackboardConfiguration()
        
        do {
            _ = try BlackboardMain(command, configuration)
            XCTFail()
        } catch BlackboardError.missingOutput {
            // success
        } catch {
            XCTFail()
        }
    }
    
    // MARK: - Input and Output Tests
    
    func testCommandInputOutput() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        let configuration = BlackboardConfiguration()
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.input, ["DeclarativeApp/Resources"])
        
        XCTAssertEqual(main.output, "DeclarativeApp/Source/Generated")
        
        XCTAssertEqual(main.symbols, [])
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    func testConfigurationInputOutput() throws {
        let command = try BlackboardCommand.parse([])
        
        let configuration = BlackboardConfiguration(
            input: ["Shared/Resources", "ExampleApp/Resources"],
            output: "ExampleApp/Source/Generated")
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.input, [
                        "Shared/Resources",
                        "ExampleApp/Resources"])
        
        XCTAssertEqual(main.output, "ExampleApp/Source/Generated")
        
        XCTAssertEqual(main.symbols, [])
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    func testInputOutput() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"

        let configuration = BlackboardConfiguration(
            input: ["Shared/Resources", "ExampleApp/Resources"],
            output: "ExampleApp/Source/Generated")
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.input, ["DeclarativeApp/Resources"])
        
        XCTAssertEqual(main.output, "DeclarativeApp/Source/Generated")
        
        XCTAssertEqual(main.symbols, [])
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    // MARK: - Symbols Tests
    
    func testConfigurationSymbols() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        let configuration = BlackboardConfiguration(
            symbols: ["chevron.down", "chevron.up"])
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.input, ["DeclarativeApp/Resources"])
        
        XCTAssertEqual(main.output, "DeclarativeApp/Source/Generated")
        
        XCTAssertEqual(main.symbols, ["chevron.down", "chevron.up"])
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    // MARK: - Skip Nib Validation Tests
    
    func testCommandSkipNibValidation() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipNibValidation = true
        
        let configuration = BlackboardConfiguration()
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertTrue(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    func testConfigurationSkipNibValidation() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        let configuration = BlackboardConfiguration(skips: [.nibValidation])
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertTrue(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    func testBothSkipNibValidation() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipNibValidation = true
        
        let configuration = BlackboardConfiguration(skips: [.nibValidation])
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertTrue(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    // MARK: - Skip Storyboards Tests
    
    func testCommandSkipStoryboards() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipStoryboards = true
        
        let configuration = BlackboardConfiguration()
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertTrue(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    func testConfigurationSkipStoryboards() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        let configuration = BlackboardConfiguration(skips: [.storyboards])
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertTrue(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    func testBothSkipStoryboards() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipStoryboards = true
        
        let configuration = BlackboardConfiguration(skips: [.storyboards])
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertTrue(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    // MARK: - Skip Storyboard Validation Tests
    
    func testCommandSkipStoryboardValidation() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipStoryboardValidation = true
        
        let configuration = BlackboardConfiguration()
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertTrue(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    func testConfigurationSkipStoryboardValidation() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        let configuration = BlackboardConfiguration(skips: [.storyboardValidation])
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertTrue(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    func testBothSkipStoryboardValidation() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipStoryboardValidation = true
        
        let configuration = BlackboardConfiguration(skips: [.storyboardValidation])
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertTrue(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertTrue(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertTrue(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertTrue(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertTrue(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertTrue(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertTrue(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertTrue(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertTrue(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
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
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertTrue(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    // MARK: - Skip Validation Tests
    
    func testCommandSkipValidation() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipValidation = true
        
        let configuration = BlackboardConfiguration()
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertTrue(main.skipValidation)
    }
    
    func testConfigurationSkipValidation() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        let configuration = BlackboardConfiguration(skips: [.validation])
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertTrue(main.skipValidation)
    }
    
    func testBothSkipValidation() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        command.skipValidation = true
        
        let configuration = BlackboardConfiguration(skips: [.validation])
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipNibValidation)
        XCTAssertFalse(main.skipStoryboards)
        XCTAssertFalse(main.skipStoryboardValidation)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertTrue(main.skipValidation)
    }
    
}
