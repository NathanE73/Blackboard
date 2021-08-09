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

struct Version {
    var major: Int
    var minor: Int?
    var patch: Int?
}

extension Version {
    init(_ major: Int, _ minor: Int? = nil, _ patch: Int? = nil) {
        self.init(major: major, minor: minor, patch: patch)
    }
    
    init?(_ text: String) {
        let elements = text.split(separator: ".",
                                  omittingEmptySubsequences: false)
        
        guard elements.count <= 3,
              let first = elements.first,
              let major = Int(first) else {
            return nil
        }
        
        guard let second = elements.second else {
            self.init(major)
            return
        }
        
        guard let minor = Int(second) else { return nil }
        
        guard let third = elements.third else {
            self.init(major, minor)
            return
        }
        
        guard let patch = Int(third) else { return nil }
        
        self.init(major, minor, patch)
    }
}

extension Version: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        let lhs = [lhs.major, lhs.minor ?? 0, lhs.patch ?? 0]
        let rhs = [rhs.major, rhs.minor ?? 0, rhs.patch ?? 0]
        return lhs.lexicographicallyPrecedes(rhs)
    }
}

extension Version: CustomStringConvertible {
    var description: String {
        [major, minor, patch]
            .compactMap { $0?.description }
            .joined(separator: ".")
    }
}

extension Version: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let text = try container.decode(String.self)
        guard let version = Version(text) else {
            throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Cannot initialize Version")
        }
        self = version
    }
}
