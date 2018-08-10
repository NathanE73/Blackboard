//
// Copyright (c) 2017 Nathan E. Walczak
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

struct ColorSet {
    
    let name: String
    
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    
}

extension ColorSet {
    
    init?(url: URL) {
        let contentsURL = url.appendingPathComponent("Contents.json")
        guard let data = try? Data(contentsOf: contentsURL) else {
            return nil
        }
        
        guard let assetColorSet = try? JSONDecoder().decode(AssetColorSet.self, from: data) else {
            return nil
        }

        let universalColor = assetColorSet.colors.first { color in
            return color.isUniversal
        }
        
        guard let components = universalColor?.color.components else {
            return nil
        }
        
        red = components.red
        green = components.green
        blue = components.blue
        alpha = components.alpha
        
        name = url.lastPathComponent.deletingPathExtension
    }
    
    init?(path: String) {
        let url = URL(fileURLWithPath: path, isDirectory: false)
        self.init(url: url)
    }
    
    static func colorSetsAt(path: String) -> [ColorSet] {
        var files: [String] = []
        
        let fileManager = FileManager.default
        
        let enumerator = fileManager.enumerator(atPath: path)
        while let file = enumerator?.nextObject() as? String {
            if file.pathExtension == "colorset" {
                files.append(path.appendingPathComponent(file))
            }
        }
        
        files.sort(by: <)
        
        return files.compactMap { ColorSet(path: $0) }
    }
    
}
