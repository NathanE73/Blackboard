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

class ImageSetFactory {
    
    let fileManager = FileManager.default
    
    func imageSetsAt(path: String) -> [ImageSet] {
        var files: [String] = []
        
        let enumerator = fileManager.enumerator(atPath: path)
        while let file = enumerator?.nextObject() as? String {
            if file.pathExtension == "imageset" {
                files.append(path.appendingPathComponent(file))
            }
        }
        
        files.sort(by: <)
        
        return files.compactMap(imageSetAt(path:))
    }
    
    func imageSetAt(path: String) -> ImageSet? {
        let url = URL(fileURLWithPath: path, isDirectory: false)
        
        let contentsURL = url.appendingPathComponent("Contents.json")
        guard let data = try? Data(contentsOf: contentsURL) else {
            return nil
        }
        
        let name = url.lastPathComponent.deletingPathExtension
        
        return imageSet(name: name, data: data)
    }
    
    func imageSet(name: String, data: Data) -> ImageSet? {
        guard let assetImageSet = try? JSONDecoder().decode(AssetImageSet.self, from: data) else {
            return nil
        }
        
        return ImageSet(name: name, assetImageSet: assetImageSet)
    }
    
}
