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
import Yams

struct BlackboardConfiguration: Decodable {
    var file: String?

    struct PlatformConfiguration: Decodable {
        var target: Version?
        var sdk: Version?
    }

    var ios: PlatformConfiguration?

    var input: [String]?

    var output: String?

    struct SymbolsCollection: Decodable {
        var name: String
    }

    var symbolsCollection: SymbolsCollection?

    var symbols: Set<String>?

    enum Skip: String, Decodable {
        case colors
        case dataAssets = "data-assets"
        case images
        case swiftui
        case symbols
        case uikit
        case uikitColors = "uikit-colors"
        case uikitImages = "uikit-images"
        case uikitSymbols = "uikit-symbols"
    }

    var skips: Set<Skip>?

    enum CodingKeys: String, CodingKey {
        case ios
        case input
        case output
        case symbolsCollection = "symbols-collection"
        case symbols
        case skips = "skip"
    }
}

extension BlackboardConfiguration {
    static var filename = ".blackboard.yml"

    init?(path startingPath: String) throws {
        let fileManager = FileManager.default

        var currentPath = startingPath
        while fileManager.isDirectory(currentPath) {
            let configurationFile = currentPath.appendingPathComponent(BlackboardConfiguration.filename)
            if fileManager.isFile(configurationFile) {
                self = try BlackboardConfiguration(file: configurationFile)
                return
            }

            let parentPath = currentPath.deletingLastPathComponent
            if parentPath == currentPath {
                break
            }
            currentPath = parentPath
        }

        return nil
    }

    init(file: String) throws {
        do {
            let url = URL(fileURLWithPath: file)
            let data = try Data(contentsOf: url)

            self = try YAMLDecoder().decode(Self.self, from: data)
            self.file = file
        } catch {
            throw BlackboardError.invalidConfiguration(file: file)
        }
    }
}
