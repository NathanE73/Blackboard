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

import Foundation

extension String {
    
    var firstCharacterLowercased: String {
        prefix(1).lowercased() + dropFirst()
    }
    
    var firstCharacterUppercased: String {
        prefix(1).uppercased() + dropFirst()
    }
    
    func removingSuffix(_ suffix: String) -> String {
        if hasSuffix(suffix) {
            return String(dropLast(suffix.count))
        }
        return self
    }
    
    var startsWithDecimalDigit: Bool {
        guard let firstScalar = self.unicodeScalars.first else {
            return false
        }
        return CharacterSet.decimalDigits.contains(firstScalar)
    }
    
    var trimmingWhitespaceCharacters: String {
        trimmingCharacters(in: .whitespaces)
    }
    
}

// MARK: - NSString -

extension String {
    
    var lastPathComponent: String {
        (self as NSString).lastPathComponent
    }
    
    var deletingLastPathComponent: String {
        (self as NSString).deletingLastPathComponent
    }
    
    func appendingPathComponent(_ str: String) -> String {
        (self as NSString).appendingPathComponent(str)
    }
    
    var pathExtension: String {
        (self as NSString).pathExtension
    }
    
    var deletingPathExtension: String {
        (self as NSString).deletingPathExtension
    }
    
    func appendingPathExtension(_ str: String) -> String? {
        (self as NSString).appendingPathExtension(str)
    }
    
    var expandingTildeInPath: String {
        (self as NSString).expandingTildeInPath
    }
    
}
