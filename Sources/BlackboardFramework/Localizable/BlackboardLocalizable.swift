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

import Foundation

struct BlackboardLocalizable {
    var key: String
    var keyArguments: [String]?
    var values: [BlackboardLocalizableString]
    var functionName: String
    var caseName: String
}

extension BlackboardLocalizable {
    
    init(key: String, values: [BlackboardLocalizableString] = []) {
        self.key = key
        self.values = values
        
        functionName = Naming.methodName(from: key)
        
        caseName = functionName
    }
    
    var arguments: [FormatSpecifier]? {
        if Set(values.map { $0.arguments }).count == 1 {
            return values.first?.arguments
        }
        return nil
    }
    
}

extension Collection where Element == Localizable {
    
    var blackboardLocalizables: [BlackboardLocalizable] {
        var blackboardLocalizables: [String: BlackboardLocalizable] = [:]
        
        self.forEach { localizable in
            localizable.strings.forEach { string in
                let key = string.key
                var blackboardLocalizable = blackboardLocalizables[key] ?? BlackboardLocalizable(key: key)
                let arguments = FormatSpecifier.specifiers(for: string.value)
                blackboardLocalizable.values.append(
                    BlackboardLocalizableString(
                        localeCode: localizable.localeCode,
                        localeDescription: localizable.localeDescription,
                        value: string.value,
                        arguments: arguments)
                    )
                blackboardLocalizables[key] = blackboardLocalizable
            }
        }
        
        return Array(blackboardLocalizables.values)
    }
    
}
