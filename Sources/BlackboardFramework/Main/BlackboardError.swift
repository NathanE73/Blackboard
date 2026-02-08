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

    var description: String {
        switch self {
        case let .invalidConfiguration(file):
            "Error: Unable to process configuration file: \(file)"
        case .missingInput:
            "Error: Missing expected argument '--input <input> ...'"
        case .missingOutput:
            "Error: Missing expected argument '--output <output>'"
        case let .invalidInputDirectory(directory):
            "Error: No such input directory: \(directory)"
        case let .invalidOutputDirectory(directory):
            "Error: No such output directory: \(directory)"
        }
    }
}
