//
// Copyright (c) 2017 Nathan E. Walczak
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

class AssetImageSetTests: XCTestCase {
    
    func testDecodable() {
        let json = """
            {
                "info" : {
                    "version" : 1,
                    "author" : "xcode"
                },
                "images" : [
                    {
                        "idiom" : "universal",
                        "scale" : "1x"
                    },
                    {
                        "idiom" : "universal",
                        "scale" : "2x"
                    },
                    {
                        "idiom" : "universal",
                        "scale" : "3x"
                    }
                ]
            }
            """.data(using: .utf8)!
        
        do {
            let assetImageSet = try JSONDecoder().decode(AssetImageSet.self, from: json)
            
            XCTAssertNotNil(assetImageSet.info)
            XCTAssertEqual(assetImageSet.images.count, 3)
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
            let info = try JSONDecoder().decode(AssetImageSet.Info.self, from: json)
            
            XCTAssertEqual(info.version, 1)
            XCTAssertEqual(info.author, "xcode")
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testImageDecodable() {
        let json = """
            {
                "idiom" : "universal",
                "scale" : "1x"
            }
            """.data(using: .utf8)!
        
        do {
            let image = try JSONDecoder().decode(AssetImageSet.Image.self, from: json)

            XCTAssertEqual(image.idiom, "universal")
            XCTAssertEqual(image.scale, "1x")
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
}
