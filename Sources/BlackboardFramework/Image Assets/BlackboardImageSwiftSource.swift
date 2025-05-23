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
    
    // MARK: Image Assets
    
    func appendImageAssets(images: [AssetItem<BlackboardImage>]) -> Self {
        appendHeading(filename: Filename.ImageAsset, modules: ["Foundation"])
        append("public struct ImageAsset: Hashable, Sendable") {
            append("let name: String")
        }
        append()
        append("public extension ImageAsset") {
            appendAssetItems(images) { image in
                append("static let \(image.propertyName) = ImageAsset(name: \"\(image.resourceName)\")")
            }
        }
        append()
        
        return self
    }
    
    // MARK: Image
    
    func appendImages(images: [AssetItem<BlackboardImage>], target: Version, sdk: Version) -> Self {
        appendHeading(filename: Filename.Image, modules: ["SwiftUI"], includeBundle: true)
        appendAvailability(.available(platform: .iOS, version: Version(13, 0)), target: target)
        append("public extension Image") {
            append()
            append("init(asset imageAsset: ImageAsset)") {
                append("self.init(imageAsset.name, bundle: bundle)")
            }
            append()
            append("init(asset imageAsset: ImageAsset, label: Text)") {
                append("self.init(imageAsset.name, bundle: bundle, label: label)")
            }
            append()
            append("init(decorativeAsset imageAsset: ImageAsset)") {
                append("self.init(decorative: imageAsset.name, bundle: bundle)")
            }
            append()
            appendAssetItems(images) { image in
                append("static var \(image.propertyName): Image { Image(asset: .\(image.propertyPath)) }")
            }
            append()
        }
        append()
        
        if Version(14, 0) <= sdk {
            appendAvailability(.available(platform: .iOS, version: Version(14, 0)), target: target)
            append("public extension Label where Title == Text, Icon == Image") {
                append()
                append("init(_ titleKey: LocalizedStringKey, asset imageAsset: ImageAsset)") {
                    append("self.init(titleKey, image: imageAsset.name)")
                }
                append()
                append("init<S>(_ title: S, asset imageAsset: ImageAsset) where S: StringProtocol") {
                    append("self.init(title, image: imageAsset.name)")
                }
                append()
            }
            append()
        }
        
        return self
    }
    
    // MARK: UIImage
    
    func appendUIImages(images: [AssetItem<BlackboardImage>]) -> Self {
        appendHeading(filename: Filename.UIImage, modules: ["UIKit"], includeBundle: true)
        append("public extension ImageAsset") {
            append("var image: UIImage { UIImage(asset: self) }")
        }
        append()
        append("public extension UIImage") {
            append()
            append("convenience init(asset imageAsset: ImageAsset, compatibleWith traitCollection: UITraitCollection? = nil)") {
                append("self.init(named: imageAsset.name, in: bundle, compatibleWith: traitCollection)!")
            }
            append()
            directive("#if swift(<5.9.0)")
            appendAssetItems(images) { image in
                append("static var \(image.propertyName): UIImage { UIImage(asset: .\(image.propertyPath)) }")
            }
            directive("#endif")
            append()
        }
        append()
        
        return self
    }
    
}
