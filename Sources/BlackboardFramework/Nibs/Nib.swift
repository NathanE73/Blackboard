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

struct Nib {
    
    var file: String
    
    var name: String
    
    var namedColorResources: [String]
    var namedImageResources: [String]
    
}

extension Nib: CustomStringConvertible {
    
    var description: String {
        "name: \(name)"
    }
    
}

extension Nib {
    
    init?(file: String, name: String, data: Data) {
        guard let xmlDocument = try? XMLDocument(data: data) else {
            return nil
        }
        
        let element = xmlDocument.rootElement()
        
        guard element?.attribute(forName: "launchScreen")?.stringValue != "YES" else {
            return nil
        }
        
        self.file = file
        
        self.name = name
        
        if let namedColorNodes = try? xmlDocument.nodes(forXPath: ".//resources/namedColor") {
            namedColorResources = namedColorNodes.compactMap { node in
                let element = node as? XMLElement
                return element?.attribute(forName: "name")?.stringValue
            }
        } else {
            namedColorResources = []
        }
        
        if let namedColorNodes = try? xmlDocument.nodes(forXPath: ".//resources/image[not(@catalog)]") {
            namedImageResources = namedColorNodes.compactMap { node in
                let element = node as? XMLElement
                return element?.attribute(forName: "name")?.stringValue
            }
        } else {
            namedImageResources = []
        }
    }
    
    init?(url: URL) {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        let name = url.deletingPathExtension().lastPathComponent
        
        self.init(file: url.path, name: name, data: data)
    }
    
    init?(path: String) {
        let url = URL(fileURLWithPath: path, isDirectory: false)
        self.init(url: url)
    }
    
    static func nibsAt(paths: [String]) -> [Nib] {
        let fileManager = FileManager.default
        
        var files: [String] = []
        
        paths.forEach { path in
            let enumerator = fileManager.enumerator(atPath: path)
            while let file = enumerator?.nextObject() as? String {
                if file.pathExtension == "xib" {
                    files.append(path.appendingPathComponent(file))
                }
            }
        }
        
        files.sort(by: <)
        
        return files.compactMap { Nib(path: $0) }
    }
    
}
