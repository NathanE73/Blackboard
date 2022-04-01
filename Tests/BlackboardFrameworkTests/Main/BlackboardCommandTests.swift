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

class BlackboardCommandTests: XCTestCase {
    
    func testZeroArguments() {
        let arguments = BlackboardCommand.parseOrExit([])
        
        XCTAssertNil(arguments.config)
        
        XCTAssertFalse(arguments.skipColors)
        XCTAssertFalse(arguments.skipDataAssets)
        XCTAssertFalse(arguments.skipImages)
        XCTAssertFalse(arguments.skipLocalizable)
        XCTAssertFalse(arguments.skipNibValidation)
        XCTAssertFalse(arguments.skipStoryboards)
        XCTAssertFalse(arguments.skipStoryboardValidation)
        XCTAssertFalse(arguments.skipSwiftUI)
        XCTAssertFalse(arguments.skipSymbols)
        XCTAssertFalse(arguments.skipUIKit)
        XCTAssertFalse(arguments.skipValidation)
        
        XCTAssertEqual(arguments.input, [])
        XCTAssertNil(arguments.output)
    }
    
    func testConfig() {
        let arguments = BlackboardCommand.parseOrExit([
            "--config",
            "env/.blackboard.yml"
        ])
        
        XCTAssertEqual(arguments.config, "env/.blackboard.yml")
    }
    
    func testSkips() {
        var arguments: BlackboardCommand
        
        arguments = BlackboardCommand.parseOrExit(["--skip-colors"])
        XCTAssertTrue(arguments.skipColors)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-data-assets"])
        XCTAssertTrue(arguments.skipDataAssets)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-images"])
        XCTAssertTrue(arguments.skipImages)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-localizable"])
        XCTAssertTrue(arguments.skipLocalizable)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-nib-validation"])
        XCTAssertTrue(arguments.skipNibValidation)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-storyboards"])
        XCTAssertTrue(arguments.skipStoryboards)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-storyboard-validation"])
        XCTAssertTrue(arguments.skipStoryboardValidation)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-swiftui"])
        XCTAssertTrue(arguments.skipSwiftUI)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-symbols"])
        XCTAssertTrue(arguments.skipSymbols)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-uikit"])
        XCTAssertTrue(arguments.skipUIKit)
        
        arguments = BlackboardCommand.parseOrExit(["--skip-validation"])
        XCTAssertTrue(arguments.skipValidation)
    }
    
    func testInput() {
        let arguments = BlackboardCommand.parseOrExit([
            "--input",
            "Shared/Resources",
            "ExampleApp/Resources"
        ])
        
        XCTAssertEqual(arguments.input, [
            "Shared/Resources",
            "ExampleApp/Resources"
        ])
    }
    
    func testOutput() {
        let arguments = BlackboardCommand.parseOrExit([
            "--output",
            "ExampleApp/Source/Generated"
        ])
        
        XCTAssertEqual(arguments.output, "ExampleApp/Source/Generated")
    }
    
}
