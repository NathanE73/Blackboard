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

class SwiftSourceTests: XCTestCase {
    
    func testSource() {
        let expectedSource =
        """
        //
        //  Example
        //
        
        class Example {
            
            func add(a: Int, b: Int) -> Int {
                return a + b
            }
            
        }
        """
        
        let swiftSource = SwiftSource()
        swiftSource.append("//")
        swiftSource.append("//  Example")
        swiftSource.append("//")
        swiftSource.append()
        swiftSource.append()
        swiftSource.append("class Example") {
            swiftSource.append()
            swiftSource.append("func add(a: Int, b: Int) -> Int") {
                swiftSource.append("return a + b")
            }
            swiftSource.append()
        }
        
        XCTAssertEqual(swiftSource.source, expectedSource)
    }
    
    func testAppendEmptyBlock() {
        let expectedSource =
        """
        class Empty {
        }
        """
        
        let swiftSource = SwiftSource()
        swiftSource.append("class Empty") {
            swiftSource.append()
            swiftSource.append()
            swiftSource.append()
        }
        
        XCTAssertEqual(swiftSource.source, expectedSource)
    }
    
}
