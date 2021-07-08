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

struct SymbolAliases {
    var symbols: [String: String]
}

extension SymbolAliases {
    
    static var resourcePath: String? {
        Bundle.module.path(forResource: "name_aliases_strings",
                           ofType: "txt",
                           inDirectory: "symbols")
    }
    
    static var resource: SymbolAliases? {
        guard let resourcePath = resourcePath else {
            print("error: Failed to locate symbol name aliases resource")
            return nil
        }
        
        guard let data = NSDictionary(contentsOfFile: resourcePath) else {
            print("error: Failed to read symbol name aliases resource")
            return nil
        }
        
        var symbols: [String: String] = [:]
        
        data.forEach { key, value in
            if let key = key as? String, let value = value as? String {
                symbols[key] = value
            }
        }
        
        return SymbolAliases(symbols: symbols)
    }
    
}
