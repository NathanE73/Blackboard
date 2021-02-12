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

class ConfigurationTests: XCTestCase {
    
    func testDecodable() {
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
            let configuration = try YAMLDecoder().decode(Configuration.self, from: data)
            
            XCTAssertEqual(configuration.symbols?.count, 15)
            XCTAssertEqual(configuration.symbols, [
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
    
}
