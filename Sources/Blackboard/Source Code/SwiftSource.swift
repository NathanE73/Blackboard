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

import Foundation

class SwiftSource {
    
    fileprivate var lines: [(indentLevel: Int, line: String)] = []
    
    func append(_ line: String = "") {
        if line == "" && line == lines.last?.line {
            return // don't allow multiple blank lines
        }
        
        lines.append((indentLevel, line))
    }
    
    func append(_ line: String, block: () -> Void) {
        append("\(line) {")
        
        let initialCount = lines.count
        
        indent(block)
        
        if lines.count - initialCount == 1, lines.last?.line.isEmpty == true {
            lines.removeLast()
        }

        append("}")
    }
    
    var source: String {
        var source: [String] = []
        
        var indentLevel = 0
        var indent = ""
        
        lines.forEach { entry in
            if indentLevel != entry.indentLevel {
                indentLevel = entry.indentLevel
                indent = ""
                for _ in 0 ..< (indentLevel) {
                    indent.append("    ")
                }
            }
            
            source.append("\(indent)\(entry.line)")
        }
        
        return source.joined(separator: "\n")
    }
    
    // MARK: Indent Level
    
    var indentLevel = 0
    
    func indent() {
        indentLevel += 1
    }
    
    func unindent() {
        indentLevel = max(0, indentLevel - 1)
    }
    
    func indent(_ block: (() -> Void)) {
        indent()
        block()
        unindent()
    }
    
}

extension SwiftSource: CustomStringConvertible {
    
    var description: String {
        return source
    }
    
}
