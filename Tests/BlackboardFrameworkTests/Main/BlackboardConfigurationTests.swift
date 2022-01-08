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
import Yams

@testable import BlackboardFramework

class BlackboardConfigurationTests: XCTestCase {
    
    func testDecodablePlatform() throws {
        let yaml = """
        ios:
          target: 13.0
          sdk: 15.0
        """
        
        let data = Data(yaml.utf8)
        
        do {
            let configuration = try YAMLDecoder().decode(BlackboardConfiguration.self, from: data)
            
            let ios = try XCTUnwrap(configuration.ios)
            XCTAssertEqual(ios.target, Version(13, 0))
            XCTAssertEqual(ios.sdk, Version(15, 0))
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodableInput() throws {
        let yaml = """
        input:
        - Shared/Resources
        - ExampleApp/Resources
        """
        
        let data = Data(yaml.utf8)
        
        do {
            let configuration = try YAMLDecoder().decode(BlackboardConfiguration.self, from: data)
            
            let input = try XCTUnwrap(configuration.input)
            XCTAssertEqual(input.count, 2)
            XCTAssertEqual(input, [
                            "Shared/Resources",
                            "ExampleApp/Resources"])
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodableOutput() {
        let yaml = """
        output: Source/Generated
        """
        
        let data = Data(yaml.utf8)
        
        do {
            let configuration = try YAMLDecoder().decode(BlackboardConfiguration.self, from: data)
            
            XCTAssertEqual(configuration.output, "Source/Generated")
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodableSymbols() throws {
        let yaml = """
        symbols:
        - 14.square.fill
        - case
        - case.fill
        - chevron.down
        - chevron.up
        - die.face.1
        - die.face.4
        - infinity.circle.fill
        - minus.circle.fill
        - person
        - person.2
        - plus.circle.fill
        - return
        - repeat
        - repeat.circle
        """
        
        let data = Data(yaml.utf8)
        
        do {
            let configuration = try YAMLDecoder().decode(BlackboardConfiguration.self, from: data)
            
            let symbols = try XCTUnwrap(configuration.symbols)
            XCTAssertEqual(symbols.count, 15)
            XCTAssertEqual(symbols, [
                            "14.square.fill",
                            "case",
                            "case.fill",
                            "chevron.down",
                            "chevron.up",
                            "die.face.1",
                            "die.face.4",
                            "infinity.circle.fill",
                            "minus.circle.fill",
                            "person",
                            "person.2",
                            "plus.circle.fill",
                            "return",
                            "repeat",
                            "repeat.circle"])
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodableSkips() throws {
        let yaml = """
        skip:
        - colors
        - data-assets
        - images
        - nib-validation
        - storyboards
        - storyboard-validation
        - swiftui
        - symbols
        - uikit
        - validation
        """
        
        let data = Data(yaml.utf8)
        
        do {
            let configuration = try YAMLDecoder().decode(BlackboardConfiguration.self, from: data)
            
            let skips = try XCTUnwrap(configuration.skips)
            XCTAssertEqual(skips.count, 10)
            XCTAssertEqual(skips, [
                .colors,
                .dataAssets,
                .images,
                .nibValidation,
                .storyboards,
                .storyboardValidation,
                .swiftui,
                .symbols,
                .uikit,
                .validation
            ])
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodableLocalizableConfiguration() throws {
        let yaml = """
        localizable:
          base: en_CA
          use-main-bundle: true
          include:
          - greetings
          - one_hundred_percent
          exclude:
          - photoRedCup
          arguments:
            "Days since last injury: %@": [days]
            COOKIE_COUNT: [numberOfCookies]
            greetings: [firstName, lastName]
        """
        
        let data = Data(yaml.utf8)
        
        do {
            let configuration = try YAMLDecoder().decode(BlackboardConfiguration.self, from: data)
            
            let localizable = try XCTUnwrap(configuration.localizable)
            XCTAssertEqual(localizable.base, "en_CA")
            XCTAssertEqual(localizable.useMainBundle, true)
            XCTAssertEqual(localizable.includeKeys, ["greetings", "one_hundred_percent"])
            XCTAssertEqual(localizable.excludeKeys, ["photoRedCup"])
            XCTAssertEqual(localizable.keyArguments, [
                "Days since last injury: %@": ["days"],
                "COOKIE_COUNT": ["numberOfCookies"],
                "greetings": ["firstName", "lastName"]
            ])
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
}
