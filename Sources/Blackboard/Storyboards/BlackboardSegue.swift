//
// Copyright (c) 2018 Nathan E. Walczak
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

struct BlackboardSegue {
    
    var name: String
    var enumName: String
    var identifier: String
    var viewControllerClassName: String?
    var navigationControllerClassName: String?
    
}

extension BlackboardSegue {
    
    init?(_ segue: StoryboardSegue, storyboard: Storyboard, storyboards: [Storyboard]) {
        guard let identifier = segue.identifier else {
            return nil
        }
        
        self.name = identifier
        
        self.enumName = name.firstCharacterLowercased
        
        self.identifier = identifier
        
        var storyboard = storyboard
        
        var destinationViewController = storyboard.viewControllerWith(id: segue.destination)
        
        if let storyboardName = destinationViewController?.storyboardName {
            storyboard = storyboards.first(withName: storyboardName) ?? storyboard
            destinationViewController = storyboard.initialViewController
        }
        
        let destinationCustomClass = destinationViewController?.customClass ?? destinationViewController?.type.className
        
        if destinationViewController?.type == .navigationController {
            guard let rootViewControllerSegue = destinationViewController?.segueWith(kind: .relationship) else {
                return nil
            }
            guard let rootViewController = storyboard.viewControllerWith(id: rootViewControllerSegue.destination) else {
                return nil
            }
            viewControllerClassName = rootViewController.customClass ?? rootViewController.type.className
            navigationControllerClassName = destinationCustomClass
        }
        else {
            viewControllerClassName = destinationCustomClass
            navigationControllerClassName = nil
        }
    }
    
}
