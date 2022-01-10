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
    
    func processLocalizable(_ input: [String], _ output: String) -> [BlackboardLocalizable] {
        guard !skipLocalizable else { return [] }
        
        let localizables = LocalizableFactory().localizablesAt(paths: input).sorted {
            $0.localeCode == localizable.base ||
            $0.localeDescription.localizedCaseInsensitiveCompare($1.localeDescription) == .orderedAscending
        }
        
        let includeKeys = localizable.includeKeys
        let excludeKeys = localizable.excludeKeys
        let keyArguments = localizable.keyArguments
        
        let blackboardLocalizables = localizables.blackboardLocalizables
            .filter { element in
                let key = element.key
                if !includeKeys.isEmpty && !includeKeys.contains(key) {
                    return false
                }
                if excludeKeys.contains(key) {
                    return false
                }
                return true
            }
            .map { element -> BlackboardLocalizable in
                var element = element
                element.keyArguments = keyArguments[element.key]
                return element
            }
            .sorted {
                $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending
            }
        
        guard !blackboardLocalizables.isEmpty else { return [] }
        
        SwiftSourceFile(Filename.Localizable, at: output)
            .appendLocalizable(
                localizables: blackboardLocalizables,
                useMainBundle: localizable.useMainBundle)
            .write()
        
        return blackboardLocalizables
    }
    
    func validateLocalizables(_ localizables: [BlackboardLocalizable]) {
        guard !skipValidation && !skipLocalizableValidation else { return }
        
        let keys = Set(localizables.map(\.key))
        
        Set(localizable.includeKeys).subtracting(keys).sorted().forEach { key in
            print("\(configurationFile): warning: invalid localizable include key: '\(key)'")
        }
        
        Set(localizable.keyArguments.keys).subtracting(keys).sorted().forEach { key in
            print("\(configurationFile): warning: invalid localizable arguments key: '\(key)'")
        }
    }
    
}
