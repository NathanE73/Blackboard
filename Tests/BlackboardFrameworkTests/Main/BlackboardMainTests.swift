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

class BlackboardMainTests: XCTestCase {
    
    // MARK: - Missing Input Tests
    
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
    
    // MARK: - Missing Output Tests
    
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
        
        XCTAssertNil(main.symbolsCollectionName)
        XCTAssertEqual(main.symbols, [])
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    func testConfigurationInputOutput() throws {
        let command = try BlackboardCommand.parse([])
        
        let configuration = BlackboardConfiguration(
            input: ["Shared/Resources", "DeclarativeApp/Resources"],
            output: "DeclarativeApp/Source/Generated")
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.input, [
                        "Shared/Resources",
                        "DeclarativeApp/Resources"])
        
        XCTAssertEqual(main.output, "DeclarativeApp/Source/Generated")
        
        XCTAssertNil(main.symbolsCollectionName)
        XCTAssertEqual(main.symbols, [])
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
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
            input: ["Shared/Resources", "DeclarativeApp/Resources"],
            output: "DeclarativeApp/Source/Generated")
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.input, ["DeclarativeApp/Resources"])
        
        XCTAssertEqual(main.output, "DeclarativeApp/Source/Generated")
        
        XCTAssertNil(main.symbolsCollectionName)
        XCTAssertEqual(main.symbols, [])
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
    // MARK: - Symbols Collection Tests
    
    func testConfigurationSymbolsCollection() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        let symbolsCollection = BlackboardConfiguration.SymbolsCollection(
            name: "Example App")
        
        let configuration = BlackboardConfiguration(
            symbolsCollection: symbolsCollection)
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.input, ["DeclarativeApp/Resources"])
        
        XCTAssertEqual(main.output, "DeclarativeApp/Source/Generated")
        
        XCTAssertEqual(main.symbolsCollectionName, "Example App")
        XCTAssertEqual(main.symbols, [])
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
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
        
        XCTAssertNil(main.symbolsCollectionName)
        XCTAssertEqual(main.symbols, ["chevron.down", "chevron.up"])
        
        XCTAssertFalse(main.skipColors)
        XCTAssertFalse(main.skipDataAssets)
        XCTAssertFalse(main.skipImages)
        XCTAssertFalse(main.skipSwiftUI)
        XCTAssertFalse(main.skipSymbols)
        XCTAssertFalse(main.skipUIKit)
        XCTAssertFalse(main.skipValidation)
    }
    
}
