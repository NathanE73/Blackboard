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

extension SwiftSource {
    
    // MARK: Color Assets
    
    func appendColorAssets(colors: [AssetItem<BlackboardColor>]) -> Self {
        appendHeading(filename: Filename.ColorAsset, modules: ["Foundation"])
        append("public struct ColorAsset: Hashable, Sendable") {
            append("let name: String")
        }
        append()
        append("public extension ColorAsset") {
            appendAssetItems(colors) { color in
                append("static let \(color.propertyName) = ColorAsset(name: \"\(color.resourceName)\")")
            }
        }
        append()
        
        return self
    }

    // MARK: Color
    
    func appendColors(colors: [AssetItem<BlackboardColor>], target: Version) -> Self {
        appendHeading(filename: Filename.Color, modules: ["SwiftUI"], includeBundle: true)
        appendAvailability(.available(platform: .iOS, version: Version(13, 0)), target: target)
        append("public extension Color") {
            append()
            append("init(asset colorAsset: ColorAsset)") {
                append("self.init(colorAsset.name, bundle: bundle)")
            }
            append()
            directive("#if swift(<5.9.0)")
            appendAssetItems(colors) { color in
                append("static var \(color.propertyName): Color { Color(asset: .\(color.propertyPath)) }")
            }
            directive("#endif")
            append()
        }
        append()
        directive("#if swift(<5.9.0)")
        appendAvailability(.available(platform: .iOS, version: Version(13, 0)), target: target)
        append("public extension ShapeStyle where Self == Color") {
            append()
            colors.forEach { asset in
                if case let .asset(color) = asset, color.namespace == nil {
                    append("static var \(color.propertyName): Color { Color(asset: .\(color.propertyPath)) }")
                }
            }
            append()
        }
        directive("#endif")
        append()

        return self
    }
    
    // MARK: CGColor
    
    func appendCGColors(colors: [AssetItem<BlackboardColor>]) -> Self {
        appendHeading(filename: Filename.CGColor, modules: ["CoreGraphics"])
        append("public extension ColorAsset") {
            append("var cgColor: CGColor { color.cgColor }")
        }
        append()
        directive("#if swift(<5.9.0)")
        append("public extension CGColor") {
            appendAssetItems(colors) { color in
                append("static var \(color.propertyName): CGColor { ColorAsset.\(color.propertyPath).cgColor }")
            }
        }
        directive("#endif")
        append()
        
        return self
    }
    
    // MARK: UIColor
    
    func appendUIColors(colors: [AssetItem<BlackboardColor>]) -> Self {
        appendHeading(filename: Filename.UIColor, modules: ["UIKit"], includeBundle: true)
        append("public extension ColorAsset") {
            append("var color: UIColor { UIColor(asset: self) }")
        }
        append()
        append("public extension UIColor") {
            append()
            append("convenience init(asset colorAsset: ColorAsset, compatibleWith traitCollection: UITraitCollection? = nil)") {
                append("self.init(named: colorAsset.name, in: bundle, compatibleWith: traitCollection)!")
            }
            append()
            directive("#if swift(<5.9.0)")
            appendAssetItems(colors) { color in
                append("static var \(color.propertyName): UIColor { UIColor(asset: .\(color.propertyPath)) }")
            }
            directive("#endif")
            append()
        }
        append()
        
        return self
    }
    
}
