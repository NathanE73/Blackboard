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

class AssetColorSetColorColorComponentsTests: XCTestCase {
    
    func testDecodableDoubles() {
        let json = """
          {
            "red" : 0.3137254901960784,
            "green" : 0.7843137254901961,
            "blue" : 0.4705882352941176,
            "alpha" : 1
          }
        """
        let data = Data(json.utf8)
        
        do {
            let components = try JSONDecoder().decode(AssetColorSet.Color.Color.Components.self, from: data)
            
            XCTAssertEqual(components.red, 0.3137254901960784)
            XCTAssertEqual(components.green, 0.7843137254901961)
            XCTAssertEqual(components.blue, 0.4705882352941176)
            XCTAssertEqual(components.alpha, 1)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodableDoubleStrings() {
        let json = """
          {
            "red" : "0.313",
            "green" : "0.784",
            "blue" : "0.470",
            "alpha" : "0.975"
          }
        """
        let data = Data(json.utf8)
        
        do {
            let components = try JSONDecoder().decode(AssetColorSet.Color.Color.Components.self, from: data)
            
            XCTAssertEqual(components.red, 0.313)
            XCTAssertEqual(components.green, 0.784)
            XCTAssertEqual(components.blue, 0.470)
            XCTAssertEqual(components.alpha, 0.975)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodableHexadecimalStrings() {
        let json = """
          {
            "red" : "0x50",
            "green" : "0xC8",
            "blue" : "0x78",
            "alpha" : "1.000"
          }
        """
        let data = Data(json.utf8)
        
        do {
            let components = try JSONDecoder().decode(AssetColorSet.Color.Color.Components.self, from: data)
            
            XCTAssertEqual(components.red, 0.3137254901960784)
            XCTAssertEqual(components.green, 0.7843137254901961)
            XCTAssertEqual(components.blue, 0.47058823529411764)
            XCTAssertEqual(components.alpha, 1.000)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodableIntegerStrings() {
        let json = """
          {
            "red" : "234",
            "green" : "60",
            "blue" : "83",
            "alpha" : "1.000"
          }
        """
        let data = Data(json.utf8)
        
        do {
            let components = try JSONDecoder().decode(AssetColorSet.Color.Color.Components.self, from: data)
            
            XCTAssertEqual(components.red, 0.9176470588235294)
            XCTAssertEqual(components.green, 0.23529411764705882)
            XCTAssertEqual(components.blue, 0.3254901960784314)
            XCTAssertEqual(components.alpha, 1.000)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
}
