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
    
    func processImages(_ input: [String], _ output: String) -> [ImageSet] {
        guard !skipImages else { return [] }
        
        let imageSets = ImageSetFactory().imageSetsAt(paths: input)
        
        let blackboardImages = imageSets.compactMap(BlackboardImage.init)
            .sorted { $0.propertyName.localizedCaseInsensitiveCompare($1.propertyName) == .orderedAscending }
        
        guard !blackboardImages.isEmpty else {
            return []
        }
        
        let includeSwiftUI = !skipSwiftUI
        let includeUIKit = !skipUIKit && !skipUIKitImages
        
        if includeSwiftUI || includeUIKit {
            SwiftSourceFile(Filename.ImageAsset, at: output)
                .appendImageAssets(images: blackboardImages)
                .write()
        }
        
        if includeSwiftUI {
            SwiftSourceFile(Filename.Image, at: output)
                .appendImages(images: blackboardImages, target: ios.target, sdk: ios.sdk)
                .write()
        }
        
        if includeUIKit {
            SwiftSourceFile(Filename.UIImage, at: output)
                .appendUIImages(images: blackboardImages)
                .write()
        }
        
        return imageSets
    }
    
}
