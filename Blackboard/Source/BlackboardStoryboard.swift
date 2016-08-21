//
// Copyright (c) 2016 Nathan E. Walczak
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

struct BlackboardStoryboard {
    
    let name: String
    let extensionName: String
    
    let viewControllers: [BlackboardViewController]
    
}

extension BlackboardStoryboard {
    
    init?(storyboard: Storyboard) {
        name = storyboard.name
        
        extensionName = storyboard.name
            .stringByRemovingSuffixString("Storyboard") + "StoryboardExtensions.swift"
        
        viewControllers = storyboard.viewControllers
            .flatMap { BlackboardViewController(viewController: $0, storyboard: storyboard) }
            .sorted { $0.className < $1.className }
        guard !viewControllers.isEmpty else {
            return nil
        }
    }
    
}

extension SwiftSource {
    
    func appendStoryboard(_ storyboard: BlackboardStoryboard) {
        append("//")
        append("//  \(storyboard.extensionName)")
        append("//")
        append("//  This file is automatically generated; do not modify.")
        append("//")
        append()
        append("import UIKit")
        append()
        append("private let sharedStoryboardInstance = UIStoryboard(name: \"\(storyboard.name)\", bundle: nil)")
        append()
        appendInitializeBlockObject()
        appendViewControllers(storyboard.viewControllers)
    }
    
}
