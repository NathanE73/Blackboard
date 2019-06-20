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
    
    func appendCGColors(colors: [BlackboardColor]) {
        appendHeading(filename: Filename.CGColor, modules: ["UIKit"], includeBundle: false)
        append("extension CGColor") {
            append()
            colors.forEach(appendCGColor)
        }
        append()
    }
    
    func appendCGColor(color: BlackboardColor) {
        append("static var \(color.functionName): CGColor") {
            append("return UIColor.\(color.functionName).cgColor")
        }
        append()
    }
    
    func appendUIColors(colors: [BlackboardColor]) {
        appendHeading(filename: Filename.UIColor, modules: ["UIKit"], includeBundle: false)
        append("fileprivate func color(identifier: ColorAssetName, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor") {
            append("if #available(iOS 11.0, *)") {
                append("if let color = UIColor(named: identifier.rawValue)") {
                    append("return color")
                }
            }
            append("return UIColor(red: red, green: green, blue: blue, alpha: alpha)")
        }
        append()
        append("enum ColorAssetName: String") {
            append()
            colors.forEach { color in
                append("case \(color.caseName) = \"\(color.name)\"")
            }
            append()
            append("var color: UIColor") {
                append("switch self {")
                colors.forEach { color in
                    append("case .\(color.caseName):")
                    indent {
                        append("return .\(color.caseName)")
                    }
                }
                append("}")
            }
            append()
        }
        append()
        append("extension UIColor") {
            append()
            colors.forEach(appendUIColor)
        }
        append()
    }
    
    func appendUIColor(color: BlackboardColor) {
        guard color.isStock == false else { return }
        
        append("// \(color.hexValue) \(color.rgbaValue)")
        append("static let \(color.functionName) = color(identifier: .\(color.caseName), red: \(color.redStringValue), green: \(color.greenStringValue), blue: \(color.blueStringValue), alpha: \(color.alphaStringValue))")
        append()
    }
    
}
