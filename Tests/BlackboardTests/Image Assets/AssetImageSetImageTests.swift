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

@testable import Blackboard

class AssetImageSetImageTests: XCTestCase {
    
    func testDecodable() {
        let json = """
          {
            "idiom" : "iphone",
            "scale" : "1x"
          }
        """
        let data = Data(json.utf8)
        
        do {
            let image = try JSONDecoder().decode(AssetImageSet.Image.self, from: data)
            
            XCTAssertEqual(image.idiom, .iphone)
            XCTAssertEqual(image.scale, .one)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDefaultIdiom() {
        let json = """
          {
            "scale" : "1x"
          }
        """
        let data = Data(json.utf8)
        
        do {
            let image = try JSONDecoder().decode(AssetImageSet.Image.self, from: data)
            
            XCTAssertEqual(image.idiom, .universal)
            XCTAssertEqual(image.scale, .one)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testOptionalScale() {
        let json = """
          {
            "idiom" : "ipad"
          }
        """
        let data = Data(json.utf8)
        
        do {
            let image = try JSONDecoder().decode(AssetImageSet.Image.self, from: data)
            
            XCTAssertEqual(image.idiom, .ipad)
            XCTAssertNil(image.scale)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testScaleRawValues() {
        let scale = AssetImageSet.Image.Scale.self
        
        XCTAssertEqual(scale.one.rawValue, "1x")
        XCTAssertEqual(scale.two.rawValue, "2x")
        XCTAssertEqual(scale.three.rawValue, "3x")
    }
    
}
