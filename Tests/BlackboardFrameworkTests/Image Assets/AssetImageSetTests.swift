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
        """
        let data = Data(json.utf8)
        
        do {
            let assetImageSet = try JSONDecoder().decode(AssetImageSet.self, from: data)
            
            XCTAssertNotNil(assetImageSet.info)
            XCTAssertEqual(assetImageSet.images.count, 3)
        }
        catch {
            XCTFail(error.localizedDescription)
        }
    }
    
}
