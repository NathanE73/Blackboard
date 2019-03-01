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

// MARK: - XMLDocument -

extension XCTestCase {
    
    func document(of xmlString: String, file: StaticString = #file, line: UInt = #line) -> XMLDocument? {
        do {
            let document = try XMLDocument(xmlString: xmlString, options: [])
            return document
        } catch {
            XCTFail("Unable to parse XML document.", file: file, line: line)
            return nil
        }
    }
    
    func rootElement(of xmlString: String, file: StaticString = #file, line: UInt = #line) -> XMLElement? {
        let document = self.document(of: xmlString, file: file, line: line)
        
        guard let rootElement = document?.rootElement() else {
            XCTFail("Missing root element from XML document.", file: file, line: line)
            return nil
        }
        return rootElement
    }
    
}
