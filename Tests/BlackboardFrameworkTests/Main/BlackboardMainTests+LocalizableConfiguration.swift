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

extension BlackboardMainTests {
    
    func testDefaultLocalizableConfiguration() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        let configuration = BlackboardConfiguration()
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.localizable.base, "en")
        XCTAssertEqual(main.localizable.useMainBundle, false)
        XCTAssertEqual(main.localizable.includeKeys, [])
        XCTAssertEqual(main.localizable.excludeKeys, [])
        XCTAssertEqual(main.localizable.keyArguments, [:])
    }
    
    func testConfigurationLocalizableConfiguration() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        var configuration = BlackboardConfiguration()
        configuration.localizable = .init(
            base: "en_CA",
            useMainBundle: true
        )
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.localizable.base, "en_CA")
        XCTAssertEqual(main.localizable.useMainBundle, true)
        XCTAssertEqual(main.localizable.includeKeys, [])
        XCTAssertEqual(main.localizable.excludeKeys, [])
        XCTAssertEqual(main.localizable.keyArguments, [:])
    }
    
    func testConfigurationLocalizableIncludeKeysConfiguration() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        var configuration = BlackboardConfiguration()
        configuration.localizable = .init(
            base: "en_CA",
            useMainBundle: true,
            includeKeys: ["greetings", "one_hundred_percent"]
        )
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.localizable.base, "en_CA")
        XCTAssertEqual(main.localizable.useMainBundle, true)
        XCTAssertEqual(main.localizable.includeKeys, ["greetings", "one_hundred_percent"])
        XCTAssertEqual(main.localizable.excludeKeys, [])
        XCTAssertEqual(main.localizable.keyArguments, [:])
    }
    
    func testConfigurationLocalizableExcludeKeysConfiguration() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        var configuration = BlackboardConfiguration()
        configuration.localizable = .init(
            base: "en_CA",
            useMainBundle: true,
            excludeKeys: ["photoRedCup"]
        )
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.localizable.base, "en_CA")
        XCTAssertEqual(main.localizable.useMainBundle, true)
        XCTAssertEqual(main.localizable.includeKeys, [])
        XCTAssertEqual(main.localizable.excludeKeys, ["photoRedCup"])
        XCTAssertEqual(main.localizable.keyArguments, [:])
    }
    
    func testConfigurationLocalizableKeyArgumentsConfiguration() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        var configuration = BlackboardConfiguration()
        configuration.localizable = .init(
            base: "en_CA",
            useMainBundle: true,
            keyArguments: [
                    "Days since last injury: %@": ["days"],
                    "COOKIE_COUNT": ["numberOfCookies"],
                    "greetings": ["firstName", "lastName"]
            ]
        )
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.localizable.base, "en_CA")
        XCTAssertEqual(main.localizable.useMainBundle, true)
        XCTAssertEqual(main.localizable.includeKeys, [])
        XCTAssertEqual(main.localizable.excludeKeys, [])
        XCTAssertEqual(main.localizable.keyArguments, [
            "Days since last injury: %@": ["days"],
            "COOKIE_COUNT": ["numberOfCookies"],
            "greetings": ["firstName", "lastName"]
        ])
    }
    
    func testConfigurationLocalizableWithIncludeKeysAndKeyArgumentsConfiguration() throws {
        var command = try BlackboardCommand.parse([])
        command.input = ["DeclarativeApp/Resources"]
        command.output = "DeclarativeApp/Source/Generated"
        
        var configuration = BlackboardConfiguration()
        configuration.localizable = .init(
            base: "en_CA",
            useMainBundle: true,
            includeKeys: ["greetings", "one_hundred_percent"],
            keyArguments: [
                    "Days since last injury: %@": ["days"],
                    "COOKIE_COUNT": ["numberOfCookies"],
                    "greetings": ["firstName", "lastName"]
            ]
        )
        
        let main = try BlackboardMain(command, configuration)
        
        XCTAssertEqual(main.localizable.base, "en_CA")
        XCTAssertEqual(main.localizable.useMainBundle, true)
        XCTAssertEqual(main.localizable.includeKeys, [
            "COOKIE_COUNT",
            "Days since last injury: %@",
            "greetings",
            "one_hundred_percent"
        ])
        XCTAssertEqual(main.localizable.excludeKeys, [])
        XCTAssertEqual(main.localizable.keyArguments, [
            "Days since last injury: %@": ["days"],
            "COOKIE_COUNT": ["numberOfCookies"],
            "greetings": ["firstName", "lastName"]
        ])
    }
    
}
