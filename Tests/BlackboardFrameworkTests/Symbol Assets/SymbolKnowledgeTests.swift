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

@testable import BlackboardFramework
import XCTest

class SymbolKnowledgeTests: XCTestCase {
    func testSymbolAvailability() throws {
        let file = #filePath
            .deletingLastPathComponent // SymbolAvailabilityTests.swift
            .deletingLastPathComponent // Symbol Assets
            .deletingLastPathComponent // BlackboardFrameworkTests
            .deletingLastPathComponent // Tests
            .appendingPathComponent("README")
            .appendingPathComponent("SymbolAvailability.md")

        let symbolKnowledge = try XCTUnwrap(SymbolKnowledge())

        let variantSymbols = symbolKnowledge.variantSymbols

        let parentSymbols = variantSymbols.values
            .reduce(into: [String: String]()) { result, variantSymbols in
                let symbols = variantSymbols.symbols.names
                if symbols.count == 1, let symbolName = symbols.first {
                    result[symbolName] = symbolName
                } else {
                    let baseName = variantSymbols.baseName
                    for symbol in symbols {
                        result[symbol] = baseName
                    }
                }
            }

        func availability(for symbol: String) -> String {
            guard let availability = symbolKnowledge.iOSAvailability(for: symbol) else { return "" }
            switch availability {
            case let .available(_, version):
                return " (iOS \(version))"
            case let .renamed(_, introduced, deprecated, renamed):
                let anchor = parentSymbols[renamed]?.replacingOccurrences(of: ".", with: "") ?? ""
                return " (iOS, introduced: \(introduced), deprecated: \(deprecated), renamed: [\(renamed)](#\(anchor)))"
            }
        }

        var text = "# Symbol Availability\n\n"

        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for letter in Array(alphabet) {
            text += "[\(letter)](#\(letter.lowercased()))\n"
        }

        text += "_____\n\n"

        for variantSymbols in variantSymbols.values.sorted(by: \.baseName) {
            let symbols = variantSymbols.symbols.sorted().names
            if symbols.count == 1, let symbolName = symbols.first {
                text.append("### \(symbolName)\n\(availability(for: symbolName))\n")
            } else {
                text.append("### \(variantSymbols.baseName)\n")
                for symbol in symbols {
                    text.append("- \(symbol)\(availability(for: symbol))\n")
                }
            }
            text.append("\n")
        }

        try text.write(toFile: file, atomically: true, encoding: .utf8)
    }
}
