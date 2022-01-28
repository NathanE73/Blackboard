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
    
    func processColors(_ input: [String], _ output: String) -> [ColorSet] {
        guard !skipColors else { return [] }
        
        let colorSets = ColorSetFactory().colorSetsAt(paths: input)
        
        var blackboardColors = colorSets.compactMap(BlackboardColor.init)
        blackboardColors.sort { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        guard !blackboardColors.isEmpty else {
            return []
        }
        
        let includeSwiftUI = !skipSwiftUI
        let includeUIKit = !skipUIKit && !skipUIKitColors
        
        if includeSwiftUI || includeUIKit {
            SwiftSourceFile(Filename.ColorAsset, at: output)
                .appendColorAssets(colors: blackboardColors)
                .write()
        }
        
        if includeSwiftUI {
            SwiftSourceFile(Filename.Color, at: output)
                .appendColors(colors: blackboardColors, target: ios.target)
                .write()
        }
        
        if includeUIKit {
            SwiftSourceFile(Filename.UIColor, at: output)
                .appendUIColors(colors: blackboardColors)
                .write()
            
            SwiftSourceFile(Filename.CGColor, at: output)
                .appendCGColors(colors: blackboardColors)
                .write()
        }
        
        return colorSets
    }
    
}
