//
// Copyright (c) 2019 Nathan E. Walczak
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

class AssetColorSetColorColorTests: XCTestCase {
    
    func testStandardRgbColorSpace() {
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
        """
        let data = Data(json.utf8)
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.Color.self, from: data)
            
            XCTAssertEqual(color.colorSpace, .srgb)
            XCTAssertNotNil(color.components)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDisplayP3ColorSpace() {
        let json = """
          {
            "color-space" : "display-p3",
            "components" : {
              "red" : 0.3137254901960784,
              "green" : 0.7843137254901961,
              "blue" : 0.4705882352941176,
              "alpha" : 1
            }
          }
        """
        let data = Data(json.utf8)
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.Color.self, from: data)
            
            XCTAssertEqual(color.colorSpace, .displayP3)
            XCTAssertNotNil(color.components)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testExtendedSrgbColorSpace() {
        let json = """
          {
            "color-space" : "extended-srgb",
            "components" : {
              "red" : 0.3137254901960784,
              "green" : 0.7843137254901961,
              "blue" : 0.4705882352941176,
              "alpha" : 1
            }
          }
        """
        let data = Data(json.utf8)
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.Color.self, from: data)
            
            XCTAssertEqual(color.colorSpace, .extendedSrgb)
            XCTAssertNotNil(color.components)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testExtendedLinearSrgbColorSpace() {
        let json = """
          {
            "color-space" : "extended-linear-srgb",
            "components" : {
              "red" : 0.3137254901960784,
              "green" : 0.7843137254901961,
              "blue" : 0.4705882352941176,
              "alpha" : 1
            }
          }
        """
        let data = Data(json.utf8)
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.Color.self, from: data)
            
            XCTAssertEqual(color.colorSpace, .extendedLinearSrgb)
            XCTAssertNotNil(color.components)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDefaultColorSpace() {
        let json = """
          {
            "components" : {
              "red" : 0.3137254901960784,
              "green" : 0.7843137254901961,
              "blue" : 0.4705882352941176,
              "alpha" : 1
            }
          }
        """
        let data = Data(json.utf8)
        
        do {
            let color = try JSONDecoder().decode(AssetColorSet.Color.Color.self, from: data)
            
            XCTAssertEqual(color.colorSpace, .srgb)
            XCTAssertNotNil(color.components)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testColorSpaceRawValues() {
        let colorSpace = AssetColorSet.Color.Color.ColorSpace.self
        
        XCTAssertEqual(colorSpace.srgb.rawValue, "srgb")
        XCTAssertEqual(colorSpace.displayP3.rawValue, "display-p3")
        XCTAssertEqual(colorSpace.extendedSrgb.rawValue, "extended-srgb")
        XCTAssertEqual(colorSpace.extendedLinearSrgb.rawValue, "extended-linear-srgb")
        XCTAssertEqual(colorSpace.grayGamma22.rawValue, "gray-gamma-22")
        XCTAssertEqual(colorSpace.extendedGray.rawValue, "extended-gray")
    }
    
}
