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

import Foundation

struct Naming {
    
    static func memberName(fromIdentifier identifier: String) -> String {
        return name(fromIdentifier: identifier)
    }
    
    static func methodName(fromIdentifier identifier: String, suffix: String? = nil, prefix: String? = nil) -> String {
        let name = self.name(fromIdentifier: identifier)
        
        var methodName: String
        if let prefix = prefix {
            methodName = prefix + name
        }
        else {
            methodName = name.firstCharacterLowercased
        }
        
        if let suffix = suffix {
            methodName += suffix
        }
        
        return methodName
    }
    
    static func name(fromIdentifier identifier: String) -> String {
        var name = ""
        
        var shouldUppercaseNextCharacter = true
        
        for character in identifier {
            if [" ", "_", "-"].contains(character) {
                shouldUppercaseNextCharacter = true
                continue
            }
            
            if shouldUppercaseNextCharacter {
                shouldUppercaseNextCharacter = false
                let uppercaseCharacter = String(character).uppercased()
                name += uppercaseCharacter
                continue
            }
            
            name.append(character)
        }
        
        return name
    }
    
}
