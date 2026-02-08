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

struct SymbolComponents {
    let name: String

    let baseName: String
    let isSlashed: Bool
    let shape: Shape?
    let isFilled: Bool
    let locale: Locale?
}

extension SymbolComponents {
    enum Shape: String, CaseIterable {
        case circle
        case rectangle
        case square
    }

    enum Locale: String, CaseIterable {
        // swiftlint:disable identifier_name
        case ar
        case he
        case hi
        case ja
        case ko
        case rtl // right-to-left
        case th
        case zh
        case zhTraditional = "zh.traditional"
        // swiftlint:enable identifier_name
    }

    init(name: String) {
        if let outlier = SymbolComponents.handleOutlier(name) {
            self = outlier
            return
        }

        self.name = name

        var components = name.components(separatedBy: ".")

        if name.hasSuffix(".\(Locale.zhTraditional.rawValue)") {
            components.removeLast(2)
            locale = .zhTraditional
        } else if let rawValue = components.last, let locale = Locale(rawValue: rawValue) {
            components.removeLast()
            self.locale = locale
        } else {
            locale = nil
        }

        if components.count > 1, components.last == "fill" {
            components.removeLast()
            isFilled = true
        } else {
            isFilled = false
        }

        if components.count > 1, let rawValue = components.last, let shape = Shape(rawValue: rawValue) {
            components.removeLast()
            self.shape = shape
        } else {
            shape = nil
        }

        if components.count > 1, components.last == "slash" {
            components.removeLast()
            isSlashed = true
        } else {
            isSlashed = false
        }

        baseName = components.joined(separator: ".")
    }

    private static func handleOutlier(_ name: String) -> Self? {
        switch name {
        case "play.rectangle.on.rectangle",
             "rectangle.fill.on.rectangle.fill",
             "rectangle.on.rectangle",
             "square.fill.on.square",
             "square.on.circle",
             "square.on.square":
            .init(
                name: name,
                baseName: name,
                isSlashed: false,
                shape: nil,
                isFilled: false,
                locale: nil
            )
        case "square.fill.on.circle.fill":
            .init(
                name: name,
                baseName: name,
                isSlashed: false,
                shape: nil,
                isFilled: true,
                locale: nil
            )
        case "play.rectangle.on.rectangle.fill",
             "square.fill.on.square.fill":
            .init(
                name: name,
                baseName: name.removingSuffix(".fill"),
                isSlashed: false,
                shape: nil,
                isFilled: true,
                locale: nil
            )
        default:
            nil
        }
    }
}

extension SymbolComponents: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        guard lhs.isSlashed == rhs.isSlashed else {
            return lhs.isSlashed == false
        }

        let lhsShape = lhs.shape?.rawValue ?? ""
        let rhsShape = rhs.shape?.rawValue ?? ""
        guard lhsShape == rhsShape else {
            return lhsShape < rhsShape
        }

        guard lhs.isFilled == rhs.isFilled else {
            return lhs.isFilled == false
        }

        return lhs.locale?.rawValue ?? "" < rhs.locale?.rawValue ?? ""
    }
}

extension [SymbolComponents] {
    var names: [String] {
        map(\.name)
    }

    var onlyShape: SymbolComponents.Shape? {
        let shapes = Set(map(\.shape))

        if shapes.count == 1, let shape = shapes.first {
            return shape
        }

        return nil
    }
}
