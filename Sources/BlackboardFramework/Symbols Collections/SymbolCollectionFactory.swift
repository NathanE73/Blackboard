//
// Copyright (c) 2023 Nathan E. Walczak
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

class SymbolCollectionFactory {
    
    func symbolCollectionsAt(path: String) -> [SymbolCollection] {
        let fileManager = FileManager.default
        
        guard let contents = try? fileManager.contentsOfDirectory(atPath: path) else {
            return []
        }
        
        return contents.compactMap { content -> SymbolCollection? in
            let file = path.appendingPathComponent(content)
            
            guard !fileManager.isDirectory(file) else {
                return nil
            }
            
            guard file.pathExtension == "json" else {
                return nil
            }
            
            let url = URL(fileURLWithPath: file, isDirectory: false)
            
            guard let data = try? Data(contentsOf: url) else {
                return nil
            }
            
            guard var symbolCollection = try? JSONDecoder().decode(SymbolCollection.self, from: data) else {
                return nil
            }
            
            symbolCollection.file = file
            
            return symbolCollection
        }
    }
    
}
