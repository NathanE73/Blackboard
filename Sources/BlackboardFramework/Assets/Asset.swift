//
// Copyright (c) 2024 Nathan E. Walczak
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

protocol Asset {
    var namespace: String? { get }
    var name: String { get }
}

indirect enum AssetItem<A: Asset> {
    case asset(A)
    case namespace(String, [AssetItem<A>])
}

extension AssetItem: Comparable {
    
    static func < (lhs: AssetItem<A>, rhs: AssetItem<A>) -> Bool {
        switch (lhs, rhs) {
        case let (.asset(lhs), .asset(rhs)):
            return lhs.name.localizedCaseInsensitiveCompare(rhs.name) == .orderedAscending
        case let (.asset(lhs), .namespace(rhs, _)):
            return lhs.name.localizedCaseInsensitiveCompare(rhs) == .orderedAscending
        case let (.namespace(lhs, _), .asset(rhs)):
            return lhs.localizedCaseInsensitiveCompare(rhs.name) == .orderedAscending
        case let (.namespace(lhs, _), .namespace(rhs, _)):
            return lhs.localizedCaseInsensitiveCompare(rhs) == .orderedAscending
        }
    }
    
    static func == (lhs: AssetItem<A>, rhs: AssetItem<A>) -> Bool {
        switch (lhs, rhs) {
        case let (.asset(lhs), .asset(rhs)):
            return lhs.name == rhs.name
        case let (.asset(lhs), .namespace(rhs, _)):
            return lhs.name == rhs
        case let (.namespace(lhs, _), .asset(rhs)):
            return lhs == rhs.name
        case let (.namespace(lhs, _), .namespace(rhs, _)):
            return lhs == rhs
        }
    }
    
}

extension Collection {
    func mapAssets<T, E: Any>(_ transform: @escaping (E) -> T) -> [AssetItem<T>] where Element == AssetItem<E> {
        map { something in
            switch something {
            case let .asset(asset):
                return .asset(transform(asset))
            case let .namespace(namespace, assets):
                return .namespace(namespace, assets.mapAssets(transform))
            }
        }
    }
    
    func flatMapAssets<E: Any>() -> [E] where Element == AssetItem<E> {
        flatMap { something in
            switch something {
            case let .asset(asset):
                return [asset]
            case let .namespace(_, assets):
                return assets.flatMapAssets()
            }
        }

    }
}
