//
//  AssetColorSetTests.swift
//  BlackboardTests
//
//  Created by Nate Walczak on 7/25/17.
//  Copyright © 2017 Nathan E. Walczak. All rights reserved.
//

import XCTest

@testable import Blackboard

class AssetColorSetTests: XCTestCase {
    
    func testDecodable() {
        let json = """
            {
                "info" : {
                    "version" : 1,
                    "author" : "xcode"
                },
                "colors" : [
                    {
                        "idiom" : "universal",
                        "color" : {
                            "color-space" : "srgb",
                            "components" : {
                                "red" : 0.3137254901960784,
                                "green" : 0.7843137254901961,
                                "blue" : 0.4705882352941176,
                                "alpha" : 1
                            }
                        }
                    }
                ]
            }
            """.data(using: .utf8)!
        
        do {
            let assetColorSet = try JSONDecoder().decode(AssetColorSet.self, from: json)
            
            XCTAssertNotNil(assetColorSet.info)
            XCTAssertEqual(assetColorSet.colors.count, 1)
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testInfoDecodable() {
        let json = """
            {
                "version" : 1,
                "author" : "xcode"
            }
        """.data(using: .utf8)!
        
        do {
            let info = try JSONDecoder().decode(AssetColorSet.Info.self, from: json)
            
            XCTAssertEqual(info.version, 1)
            XCTAssertEqual(info.author, "xcode")
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testColorDecodable() {
        let json = """
            {
                "idiom" : "universal",
                "color" : {
                    "color-space" : "srgb",
                    "components" : {
                        "red" : 0.3137254901960784,
                        "green" : 0.7843137254901961,
                        "blue" : 0.4705882352941176,
                        "alpha" : 1
                    }
                }
            }
        """.data(using: .utf8)!
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.self, from: json)
            
            XCTAssertEqual(color.idiom, "universal")
            XCTAssertNotNil(color.color)
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testColorColorDecodable() {
        let json = """
            {
                "color-space" : "srgb",
                "components" : {
                    "red" : 0.3137254901960784,
                    "green" : 0.7843137254901961,
                    "blue" : 0.4705882352941176,
                    "alpha" : 1
                }
            }
        """.data(using: .utf8)!
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.Color.self, from: json)
            
            XCTAssertEqual(color.colorSpace, "srgb")
            XCTAssertNotNil(color.components)
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testColorColorComponentsDecodable() {
        let json = """
            {
                "red" : 0.3137254901960784,
                "green" : 0.7843137254901961,
                "blue" : 0.4705882352941176,
                "alpha" : 1
            }
        """.data(using: .utf8)!
        
        do {
            let components = try JSONDecoder().decode(AssetColorSet.Color.Color.Components.self, from: json)
            
            XCTAssertEqual(components.red, 0.3137254901960784)
            XCTAssertEqual(components.green, 0.7843137254901961)
            XCTAssertEqual(components.blue, 0.4705882352941176)
            XCTAssertEqual(components.alpha, 1)
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
}
