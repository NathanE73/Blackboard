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

enum Naming {
    
    static var keywords = [
        // used in declarations
        "associatedtype", "class", "deinit", "enum", "extension", "fileprivate",
        "func", "import", "init", "inout", "internal", "let", "open", "operator",
        "private", "protocol", "public", "rethrows", "static", "struct", "subscript",
        "typealias", "var",
        // used in statements
        "break", "case", "continue", "default", "defer", "do", "else", "fallthrough",
        "for", "guard", "if", "in", "repeat", "return", "switch", "where", "while",
        // used in expressions and types
        "as", "Any", "catch", "false", "is", "nil", "super", "self", "Self", "throw",
        "throws", "true", "try",
        // reserved in particular contexts
        "associativity", "convenience", "dynamic", "didSet", "final", "get", "infix",
        "indirect", "lazy", "left", "mutating", "none", "nonmutating", "optional",
        "override", "postfix", "precedence", "prefix", "Protocol", "required", "right",
        "set", "Type", "unowned", "weak", "and willSet"
    ]
    
    static func escapeKeyword(_ identifier: String) -> String {
        keywords.contains(identifier) ? "`\(identifier)`" : identifier
    }
    
    static func methodName(from identifier: String, prefix: String? = nil) -> String {
        var name = identifier
        
        if name.startsWithDecimalDigit {
            name = "number\(name)"
        }
        
        if let prefix = prefix {
            name = "\(prefix).\(name)"
        }
        
        return self.name(from: name, prefix: prefix)
            .firstCharacterLowercased
    }
    
    static func name(from identifier: String, prefix: String? = nil) -> String {
        identifier.split { character in
            for unicodeScalar in character.unicodeScalars {
                // swiftlint:disable:next for_where
                if !CharacterSet.alphanumerics.contains(unicodeScalar) {
                    return true
                }
            }
            return false
        }
        .map { part in
            if part == part.uppercased() {
                return part.lowercased().firstCharacterUppercased
            }
            return String(part).firstCharacterUppercased
        }
        .joined()
    }
    
    static func namespace(from namespaces: String?...) -> String? {
        let namespaces = namespaces.compactMap { $0 }
        
        if namespaces.isEmpty {
            return nil
        }
        
        return namespaces.joined(separator: "/")
    }
    
}
