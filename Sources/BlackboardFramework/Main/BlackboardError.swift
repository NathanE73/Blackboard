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

enum BlackboardError: Error, CustomStringConvertible {
    case invalidConfiguration(file: String)
    case missingInput
    case missingOutput
    case invalidInputDirectory(directory: String)
    case invalidOutputDirectory(directory: String)
    case invalidLocalizableBase(base: String)
    // swiftlint:disable:next identifier_name
    case invalidLocalizableIncludeAndExcludeProvided
    
    var description: String {
        switch self {
        case .invalidConfiguration(let file):
            return "Error: Unable to process configuration file: \(file)"
        case .missingInput:
            return "Error: Missing expected argument '--input <input> ...'"
        case .missingOutput:
            return "Error: Missing expected argument '--output <output>'"
        case .invalidInputDirectory(let directory):
            return "Error: No such input directory: \(directory)"
        case .invalidOutputDirectory(let directory):
            return "Error: No such output directory: \(directory)"
        case .invalidLocalizableBase(let base):
            return "Error: Invalid localizable base identifier provided: \(base)"
        case .invalidLocalizableIncludeAndExcludeProvided:
            return "Error: Either include or exclude of localizable keys can be provided not both"
        }
    }
}
