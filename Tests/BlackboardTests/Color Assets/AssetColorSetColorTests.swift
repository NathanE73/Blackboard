//
// Copyright (c) 2018 Nathan E. Walczak
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

@testable import Blackboard

class AssetColorSetColorTests: XCTestCase {
    
    func testDecodable() {
        let json = """
          {
            "idiom" : "ipad",
            "color" : {
              "color-space" : "srgb",
              "components" : {
                "red" : 0.3137254901960784,
                "green" : 0.7843137254901961,
                "blue" : 0.4705882352941176,
                "alpha" : 1
              }
            },
            "display-gamut": "display-P3"
          }
        """
        let data = json.data(using: .utf8)!
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.self, from: data)
            
            XCTAssertEqual(color.displayGamut, .displayP3)
            XCTAssertEqual(color.idiom, .ipad)
            XCTAssertNotNil(color.color)
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDefaultDisplayGamut() {
        let json = """
          {
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
        """
        let data = json.data(using: .utf8)!
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.self, from: data)
            
            XCTAssertEqual(color.displayGamut, .srgb)
            XCTAssertEqual(color.idiom, .universal)
            XCTAssertNotNil(color.color)
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDefaultIdiom() {
        let json = """
          {
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
        """
        let data = json.data(using: .utf8)!
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.self, from: data)
            
            XCTAssertEqual(color.idiom, .universal)
            XCTAssertNotNil(color.color)
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testColorSpaceRawValues() {
        let colorSpace = AssetColorSet.Color.DisplayGamut.self
        
        XCTAssertEqual(colorSpace.srgb.rawValue, "sRGB")
        XCTAssertEqual(colorSpace.displayP3.rawValue, "display-P3")
    }
    
    func testIdiomRawValues() {
        let idiom = AssetColorSet.Color.Idiom.self
        
        XCTAssertEqual(idiom.iphone.rawValue, "iphone")
        XCTAssertEqual(idiom.ipad.rawValue, "ipad")
        XCTAssertEqual(idiom.mac.rawValue, "mac")
        XCTAssertEqual(idiom.tv.rawValue, "tv")
        XCTAssertEqual(idiom.universal.rawValue, "universal")
        XCTAssertEqual(idiom.watch.rawValue, "watch")
    }
    
}
