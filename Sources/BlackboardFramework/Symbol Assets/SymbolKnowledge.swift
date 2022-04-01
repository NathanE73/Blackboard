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

class SymbolKnowledge {
    let symbolAvailability: SymbolAvailability
    let symbolAliases: SymbolAliases
    
    init?() {
        guard let symbolAvailability = SymbolAvailability.resource,
              let symbolAliases = SymbolAliases.resource else {
                  return nil
              }
        self.symbolAvailability = symbolAvailability
        self.symbolAliases = symbolAliases
    }
}

extension SymbolKnowledge {
    
    var knownSymbols: Set<String> {
        Set(symbolAvailability.symbols.keys)
    }
    
    func yearToRelease(for symbol: String) -> SymbolAvailability.YearToRelease? {
        guard let year = symbolAvailability.symbols[symbol],
              let yearToRelease = symbolAvailability.yearToRelease[year] else {
            return nil
        }
        return yearToRelease
    }
    
    func iOSAvailability(for symbol: String) -> Availability? {
        guard let released = yearToRelease(for: symbol) else {
            return nil
        }
        
        if let aliase = symbolAliases.symbols[symbol],
           let aliaseReleased = self.yearToRelease(for: aliase) {
               return .renamed(platform: .iOS, introduced: released.iOS, deprecated: aliaseReleased.iOS, renamed: aliase)
        }
        
        return .available(platform: .iOS, version: released.iOS)
    }
    
    var variantSymbols: [String: SymbolVariants] {
        knownSymbols.reduce([String: SymbolVariants]()) { dict, symbol in
            let symbolComponents = SymbolComponents(name: symbol)
            let baseName = symbolComponents.baseName
            
            var dict = dict
            var symbolVariants = dict[baseName] ?? SymbolVariants()
            symbolVariants.symbols.append(symbolComponents)
            dict[baseName] = symbolVariants
            return dict
        }.values.reduce([String: SymbolVariants]()) { dict, symbolVariants in
            var dict = dict
            dict[symbolVariants.baseName] = symbolVariants
            return dict
        }
    }
    
}
