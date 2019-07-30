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

extension SwiftSource {
    
    // MARK: Color Assets
    
    func appendColorAssets(colors: [BlackboardColor]) {
        appendHeading(filename: Filename.ColorAsset, modules: ["Foundation"])
        append("public enum ColorAsset: String") {
            colors.forEach { color in
                if color.caseName == color.name {
                    append("case \(color.caseName)")
                } else {
                    append("case \(color.caseName) = \"\(color.name)\"")
                }
            }
        }
        append()
    }
    
    // MARK: CGColor
    
    func appendCGColors(colors: [BlackboardColor]) {
        appendHeading(filename: Filename.CGColor, modules: ["CoreGraphics"])
        append("public extension ColorAsset") {
            append("var cgColor: CGColor { return color.cgColor }")
        }
        append()
        append("public extension CGColor") {
            colors.forEach { color in
                append("static var \(color.functionName): CGColor { return ColorAsset.\(color.functionName).cgColor }")
            }
        }
        append()
    }
    
    // MARK: UIColor
    
    func appendUIColors(colors: [BlackboardColor]) {
        appendHeading(filename: Filename.UIColor, modules: ["UIKit"], includeBundle: true)
        append("public extension ColorAsset") {
            append("var color: UIColor { return UIColor(self) }")
        }
        append()
        append("public extension UIColor") {
            append()
            append("convenience init(_ colorAsset: ColorAsset, compatibleWith traitCollection: UITraitCollection? = nil)") {
                append("self.init(named: colorAsset.rawValue, in: bundle, compatibleWith: traitCollection)!")
            }
            append()
            appendCustomColors(colors: colors, returnType: "UIColor")
            append()
        }
        append()
    }
    
    // Custom Colors
    
    func appendCustomColors(colors: [BlackboardColor], returnType: String) {
        colors.forEach { color in
            append("static var \(color.functionName): \(returnType) { return \(returnType)(.\(color.caseName)) }")
        }
    }
    
}
