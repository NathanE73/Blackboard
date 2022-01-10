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
    
    func processSymbols(_ symbols: Set<String>, _ output: String) {
        guard !skipSymbols else { return }
        
        var blackboardSymbols = BlackboardSymbolFactory()
            .symbols(for: symbols)
        blackboardSymbols.sort { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        guard !blackboardSymbols.isEmpty else {
            return
        }
        
        if !skipSwiftUI || !skipUIKit {
            SwiftSourceFile(Filename.SymbolAsset, at: output)
                .appendSymbolAssets(symbols: blackboardSymbols, target: ios.target)
                .write()
        }
        
        if !skipSwiftUI {
            SwiftSourceFile(Filename.SymbolImage, at: output)
                .appendSymbolImages(symbols: blackboardSymbols, target: ios.target, sdk: ios.sdk)
                .write()
        }
        
        if !skipUIKit {
            SwiftSourceFile(Filename.SymbolUIImage, at: output)
                .appendSymbolUIImages(symbols: blackboardSymbols, target: ios.target)
                .write()
        }
    }
    
}
