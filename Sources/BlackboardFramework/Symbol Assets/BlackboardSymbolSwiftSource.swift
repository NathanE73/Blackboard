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
    
    func appendSymbolAvailability(_ availability: Availability, target: String? = nil) {
        switch availability {
        case let .renamed(platform, introduced, deprecated, renamed):
            let renamed = Naming.symbolCaseName(from: renamed)
            appendAvailability(.renamed(platform: platform,
                                        introduced: introduced,
                                        deprecated: deprecated,
                                        renamed: renamed),
                               target: target)
        default:
            appendAvailability(availability, target: target)
        }
    }
    
    // MARK: Symbol Asset
    
    func appendSymbolAssets(symbols: [BlackboardSymbol]) -> Self {
        appendHeading(filename: Filename.SymbolAsset, modules: ["Foundation"])
        appendAvailability(.available(platform: .iOS, version: "13.0"))
        append("public enum SymbolAsset: String") {
            symbols.sorted(by: \.caseName).forEach { symbol in
                appendSymbolAvailability(symbol.iOSAvailability, target: "13.0")
                if symbol.caseName == symbol.name {
                    append("case \(Naming.escapeKeyword(symbol.caseName))")
                } else {
                    append("case \(symbol.caseName) = \"\(symbol.name)\"")
                }
            }
        }
        append()
        
        return self
    }
    
    // MARK: Symbol Image
    
    func appendSymbolImages(symbols: [BlackboardSymbol]) -> Self {
        appendHeading(filename: Filename.SymbolImage, modules: ["SwiftUI"])
        appendAvailability(.available(platform: .iOS, version: "13.0"))
        append("public extension Image") {
            append()
            append("init(symbol symbolAsset: SymbolAsset)") {
                append("self.init(systemName: symbolAsset.rawValue)")
            }
            append()
            symbols.sorted(by: \.functionName).forEach { symbol in
                appendSymbolAvailability(symbol.iOSAvailability, target: "13.0")
                append("static var \(symbol.functionName): Image { Image(symbol: .\(symbol.caseName)) }")
            }
            append()
        }
        append()
        
        appendAvailability(.available(platform: .iOS, version: "14.0"))
        append("public extension Label where Title == Text, Icon == Image") {
            append()
            append("init(_ titleKey: LocalizedStringKey, symbol symbolAsset: SymbolAsset)") {
                append("self.init(titleKey, systemImage: symbolAsset.rawValue)")
            }
            append()
            append("init<S>(_ title: S, symbol symbolAsset: SymbolAsset) where S: StringProtocol") {
                append("self.init(title, systemImage: symbolAsset.rawValue)")
            }
            append()
        }
        append()
        
        return self
    }
    
    // MARK: Symbol UIImage
    
    func appendSymbolUIImages(symbols: [BlackboardSymbol]) -> Self {
        appendHeading(filename: Filename.SymbolUIImage, modules: ["UIKit"])
        appendAvailability(.available(platform: .iOS, version: "13.0"))
        append("public extension SymbolAsset") {
            append("var image: UIImage? { UIImage(symbol: self) }")
        }
        append()
        appendAvailability(.available(platform: .iOS, version: "13.0"))
        append("public extension UIImage") {
            append()
            append("convenience init(symbol symbolAsset: SymbolAsset)") {
                append("self.init(systemName: symbolAsset.rawValue)!")
            }
            append()
            append("convenience init(symbol symbolAsset: SymbolAsset, withConfiguration configuration: UIImage.Configuration?)") {
                append("self.init(systemName: symbolAsset.rawValue, withConfiguration: configuration)!")
            }
            append()
            append("convenience init(symbol symbolAsset: SymbolAsset, compatibleWith traitCollection: UITraitCollection?)") {
                append("self.init(systemName: symbolAsset.rawValue, compatibleWith: traitCollection)!")
            }
            append()
            symbols.sorted(by: \.functionName).forEach { symbol in
                appendSymbolAvailability(symbol.iOSAvailability, target: "13.0")
                append("static var \(symbol.functionName): UIImage { UIImage(symbol: .\(symbol.caseName)) }")
            }
            append()
        }
        append()
        
        return self
    }
    
}
