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

class AssetInfoTests: XCTestCase {
    
    func testDecodable() {
        let json = """
          {
            "version" : 2,
            "author" : "Steve Dave"
          }
        """
        let data = json.data(using: .utf8)!
        
        do {
            let info = try JSONDecoder().decode(AssetInfo.self, from: data)
            
            XCTAssertEqual(info.version, 2)
            XCTAssertEqual(info.author, "Steve Dave")
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testZeplinDecodable() {
        let json = """
          {
            "version" : "3",
            "author" : "zeplin"
          }
        """
        let data = json.data(using: .utf8)!
        
        do {
            let info = try JSONDecoder().decode(AssetInfo.self, from: data)
            
            XCTAssertEqual(info.version, 3)
            XCTAssertEqual(info.author, "zeplin")
        }
        catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
}
