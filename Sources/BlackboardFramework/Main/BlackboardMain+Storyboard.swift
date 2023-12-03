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
    
    func processStoryboards(_ input: [String], _ output: String) -> [Storyboard] {
        guard !skipStoryboards else { return [] }
        
        let storyboards = Storyboard.storyboardsAt(paths: input)
        
        var storyboardExtensionsWereGenerated = false
        
        for storyboard in storyboards {
            if let storyboard = BlackboardStoryboard(storyboard, storyboards: storyboards) {
                storyboardExtensionsWereGenerated = true
                SwiftSourceFile(storyboard.extensionFilename, at: output)
                    .appendStoryboard(storyboard)
                    .write()
            }
        }
        
        // UIKit
        
        if storyboardExtensionsWereGenerated {
            SwiftSourceFile(Filename.UIKit, at: output)
                .append(source: UIKitSwiftSource)
                .write()
        }
        
        return storyboards
    }
    
    func valiateStoryboards(_ storyboards: [Storyboard], _ knownNamedColors: Set<String>, _ knownNamedImages: Set<String>) {
        guard !skipValidation && !skipStoryboardValidation else { return }
        
        storyboards.forEach { storyboard in
            if !skipColors {
                Set(storyboard.namedColorResources)
                    .subtracting(knownNamedColors)
                    .forEach { missing in
                        print("\(storyboard.file): warning: '\(storyboard.name).storyboard' references missing color named: '\(missing)'")
                    }
            }
            if !skipImages {
                Set(storyboard.namedImageResources)
                    .subtracting(knownNamedImages)
                    .forEach { missing in
                        print("\(storyboard.file): warning: '\(storyboard.name).storyboard' references missing image named: '\(missing)'")
                    }
            }
        }
    }
    
}
