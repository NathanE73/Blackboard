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

enum Naming {
    
    static func memberName(fromIdentifier identifier: String) -> String {
        name(fromIdentifier: identifier)
    }
    
    static func methodName(fromIdentifier identifier: String) -> String {
        let name = self.name(fromIdentifier: identifier)
        
        if name.startsWithDecimalDigit {
            return "number\(name)".firstCharacterLowercased
        }
        
        return name.firstCharacterLowercased
    }
    
    static func name(fromIdentifier identifier: String) -> String {
        let allowedCharacters = CharacterSet.alphanumerics
        
        var name = ""
        
        var shouldUppercaseNextCharacter = true
        
        for unicodeScalar in identifier.unicodeScalars {
            if !allowedCharacters.contains(unicodeScalar) {
                shouldUppercaseNextCharacter = true
                continue
            }
            
            let character = String(unicodeScalar)
            
            if shouldUppercaseNextCharacter {
                shouldUppercaseNextCharacter = false
                name.append(character.uppercased())
                continue
            }
            
            name.append(character)
        }
        
        return name
    }
    
    static func namespace(from namespaces: String?...) -> String? {
        let namespaces = namespaces.compactMap { $0 }
        
        if namespaces.isEmpty {
            return nil
        }
        
        return namespaces.joined(separator: "/")
    }
    
    static func symbolCaseName(from name: String) -> String {
        if ["case", "return", "repeat"].contains(name) {
            return methodName(fromIdentifier: "\(name).symbol")
        }
        
        return methodName(fromIdentifier: name)
    }
    
    static func symbolMethodName(from name: String) -> String {
        "symbol" + methodName(fromIdentifier: name).firstCharacterUppercased
    }
    
}
