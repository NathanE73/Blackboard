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

extension SwiftSource {
    
    // MARK: Localizable
    
    func appendLocalizable(localizables: [BlackboardLocalizable], useMainBundle: Bool) -> Self {
        appendHeading(filename: Filename.Localizable, modules: ["Foundation"], includeBundle: !useMainBundle)
        append("public enum Localizable: String") {
            append()
            localizables.forEach { string in
                appendLocalizableComments(values: string.values)
                
                if string.caseName == string.key {
                    append("case \(string.caseName)")
                } else {
                    append("case \(string.caseName) = \"\(string.key)\"")
                }
                append()
            }
            append()
            append("var localizedString: String") {
                let bundle = useMainBundle ? "Main.bundle" : "bundle"
                append("\(bundle).localizedString(forKey: rawValue, value: nil, table: nil)")
            }
            append()
            append("func localizedString(arguments: CVarArg...) -> String") {
                append("String(format: localizedString, arguments: arguments)")
            }
            append()
        }
        append()
        
        append("public enum L") {
            append()
            localizables.forEach { string in
                appendLocalizableComments(values: string.values)
                
                if let arguments = string.arguments, !arguments.isEmpty {
                    appendLocalizableWithArguments(string: string, arguments: arguments)
                } else {
                    append("public static var \(string.functionName): String") {
                        append("Localizable.\(string.caseName).localizedString")
                    }
                }
                
                append()
            }
            append()
        }
        
        return self
    }
    
    func appendLocalizableWithArguments(string: BlackboardLocalizable, arguments: [FormatSpecifier]) {
        var argumentsNames = arguments.enumerated()
            .map { index, _ in
                "arg\(index + 1)"
            }
        
        if let keyArguments = string.keyArguments,
           keyArguments.count == argumentsNames.count {
            argumentsNames = keyArguments
        }
        
        let funcArgs = arguments.enumerated()
            .map { index, argument in
                "\(argumentsNames[index]): \(argument.type)"
            }.joined(separator: ", ")
        
        let localizeArgs = arguments.enumerated()
            .map { index, _ in
                argumentsNames[index]
            }.joined(separator: ", ")
        
        append("public static func \(string.functionName)(\(funcArgs)) -> String") {
            append("Localizable.\(string.caseName).localizedString(arguments: \(localizeArgs))")
        }
    }
    
    func appendLocalizableComments(values: [BlackboardLocalizableString]) {
        commentBlock {
            for (index, entry) in values.enumerated() {
                if index != 0 {
                    append()
                }
                
                let value = entry.value
                    .components(separatedBy: CharacterSet.newlines)
                    .filter { !$0.isEmpty }
                    .joined(separator: "\n")
                
                append("\(entry.localeDescription): \(value)")
            }
        }
    }
    
}
