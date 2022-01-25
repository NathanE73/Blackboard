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

extension BlackboardMain {
    
    struct LocalizableConfiguration {
        var base: String
        var useMainBundle: Bool
        var includeKeys: Set<String>
        var excludeKeys: Set<String>
        var keyArguments: [String: [String]]
    }
    
}

extension BlackboardMain.LocalizableConfiguration {
    
    init(using configuration: BlackboardConfiguration?) throws {
        var configuration = configuration
        
        if let localizable = configuration?.localizable {
            if let base = localizable.base {
                let locale = Locale(identifier: base)
                guard Locale.availableIdentifiers.contains(locale.identifier) else {
                    throw BlackboardError.invalidLocalizableBase(base: base)
                }
                configuration?.localizable?.base = locale.identifier
            }
            
            if let includeKeys = localizable.includeKeys,
               let excludeKeys = localizable.excludeKeys,
               (!includeKeys.isEmpty && !excludeKeys.isEmpty) {
                throw BlackboardError.invalidLocalizableIncludeAndExcludeProvided
            }
        }
        
        let base = configuration?.localizable?.base ?? "en"
        let useMainBundle = configuration?.localizable?.useMainBundle ?? false
        var includeKeys = Set(configuration?.localizable?.includeKeys ?? [])
        let excludeKeys = Set(configuration?.localizable?.excludeKeys ?? [])
        let keyArguments = configuration?.localizable?.keyArguments ?? [:]
        
        if !includeKeys.isEmpty {
            includeKeys.formUnion(keyArguments.keys)
        }
        
        self.init(
            base: base,
            useMainBundle: useMainBundle,
            includeKeys: includeKeys,
            excludeKeys: excludeKeys,
            keyArguments: keyArguments
        )
    }
    
}
