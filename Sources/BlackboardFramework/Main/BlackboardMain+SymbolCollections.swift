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

extension BlackboardMain {
    
    func processSymbolsCollection(_ symbolCollectionName: String) {
        let input = "~/Library/Application Support/com.apple.SFSymbols/SF Symbols Library.sfsymbolslibrary/Collections"
            .expandingTildeInPath
        
        let symbolCollections = SymbolCollectionFactory().symbolCollectionsAt(path: input)
        
        symbolCollections.forEach { collection in
            guard collection.displayName == symbolCollectionName else {
                return
            }
            
            let symbols = SymbolAliases.modernize(symbols: symbols).sorted()
            
            if collection.symbols == symbols {
                print("Skipping: \(symbolCollectionName) (Symbol Collection)")
                return
            } else {
                print("Updating: \(symbolCollectionName) (Symbol Collection)")
            }
            
            var collection = collection
            collection.symbols = symbols
            
            guard let file = collection.file else {
                return
            }
            
            let url = URL(fileURLWithPath: file)
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.sortedKeys]
            
            do {
                let data = try encoder.encode(collection)
                try data.write(to: url)
            } catch {
                print("error: Failed to write: \(file)")
                exit(1)
            }
        }
    }
    
}
