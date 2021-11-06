//
// Copyright (c) 2021 Nathan E. Walczak
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

struct SymbolAvailability: Decodable {
    var symbols: [String: String]
    var yearToRelease: [String: YearToRelease]
    
    enum CodingKeys: String, CodingKey {
        case symbols
        case yearToRelease = "year_to_release"
    }
    
    struct YearToRelease: Decodable {
        var iOS: Version
    }
}

extension SymbolAvailability {
    
    static var resource: SymbolAvailability? {
        do {
            let plist = Resource.name_availability_plist
            let data = Data(plist.utf8)
            return try PropertyListDecoder().decode(SymbolAvailability.self, from: data)
        } catch {
            print("error: Failed to decode symbol name availability resource")
            return nil
        }
    }
    
}
