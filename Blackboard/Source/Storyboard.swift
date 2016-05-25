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

struct Storyboard {
    
    let name: String
    
    let viewControllers: [StoryboardViewController]
    
}

extension Storyboard {
    
    func viewControllerWith(id id: String) -> StoryboardViewController? {
        return viewControllers
            .filter { $0.id == id }
            .first
    }
    
    func navigationControllerFor(id id: String) -> StoryboardViewController? {
        return viewControllers
            .filter { $0.type == .NavigationController }
            .filter { viewController in
                return viewController.segues
                    .filter { $0.destination == id}
                    .isEmpty == false
            }
            .first
    }
    
}

extension Storyboard: CustomStringConvertible {
    
    var description: String {
        return "name: \(name), viewControllers.count: \(viewControllers.count)"
    }
    
}

extension Storyboard {
    
    init?(url: NSURL) {
        guard let xmlDocument = try? NSXMLDocument(contentsOfURL: url, options: 0) else {
            return nil
        }
        
        guard xmlDocument.rootElement()?.attributeForName("launchScreen")?.stringValue != "YES" else {
            return nil
        }
        
        guard let name = url.URLByDeletingPathExtension?.lastPathComponent else {
            return nil
        }
        self.name = name
        
        guard let sceneNodes = try? xmlDocument.nodesForXPath("//scene") else {
            return nil
        }
        viewControllers = sceneNodes.flatMap(StoryboardViewController.init)
    }
    
    init?(path: String) {
        let url = NSURL(fileURLWithPath: path, isDirectory: false)
        self.init(url: url)
    }
    
    static func storyboardsAt(path path: String) -> [Storyboard] {
        var files: [String] = []
        
        let fileManager = NSFileManager.defaultManager()
        
        let enumerator = fileManager.enumeratorAtPath(path)
        while let file = enumerator?.nextObject() as? String {
            if file.pathExtension == "storyboard" {
                files.append(path.stringByAppendingPathComponent(file))
            }
        }
        
        files.sortInPlace(<)
        
        return files.flatMap { Storyboard(path: $0) }
    }
    
}
