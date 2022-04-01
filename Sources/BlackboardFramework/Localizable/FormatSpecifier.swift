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

// https://pubs.opengroup.org/onlinepubs/009695399/functions/printf.html
// https://developer.apple.com/library/archive/documentation/CoreFoundation/Conceptual/CFStrings/formatSpecifiers.html

import Foundation

enum FormatSpecifier {
    case string
    case other
}

extension FormatSpecifier {
    
    init?(character: Character) {
        switch character.lowercased() {
        case "@":
            self = .string
        default:
            return nil
        }
    }
    
    var type: String {
        switch self {
        case .string:
            return "String"
        case .other:
            return "CVarArg"
        }
    }
    
    static func specifiers(for value: String) -> [FormatSpecifier]? {
        let pattern = "%%|%@|(%)([1-9]\\d*)(\\$@)|%"
        
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return nil
        }
        
        guard let groups = regex.groupsFor(value) else {
            return nil
        }
        
        let results = groups.compactMap { group -> FormatSpecifier? in
            if group.first == "%%" { return nil }
            
            if group.first == "%@" { return .string }
            if group.fourth == "$@" { return .string }
            
            if group.first == "%" { return .other }
            
            return nil
        }
        
        if Set(results) == [.string] {
            return results
        }
        
        return results.map { _ in .other }
    }
    
}
