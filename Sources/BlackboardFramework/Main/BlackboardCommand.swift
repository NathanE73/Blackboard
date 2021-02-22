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

import ArgumentParser
import Foundation

struct BlackboardCommand: ParsableCommand {
    
    static var configuration = CommandConfiguration(
        commandName: "blackboard",
        version: BlackboardVersion.version)
    
    @Flag(help: "Skip generating color extensions (Color, CGColor, and UIColor)")
    var skipColors = false
    
    @Flag(help: "Skip generating data asset extensions (NSDataAsset)")
    var skipDataAssets = false
    
    @Flag(help: "Skip generating image extensions (Image, UIImage)")
    var skipImages = false
    
    @Flag(help: "Skip generating storyboard extensions (UIStoryboard)")
    var skipStoryboards = false
    
    @Flag(name: .customLong("skip-swiftui"),
          help: "Skip generating SwiftUI extensions (Color, Image)")
    var skipSwiftUI = false
    
    @Flag(help: "Skip generating symbol extensions (Image, UIImage)")
    var skipSymbols = false
    
    @Flag(name: .customLong("skip-uikit"),
          help: "Skip generating UIKit extensions (UIColor, UIImage)")
    var skipUIKit = false
    
    @Flag(help: "Skip validation of storyboard resource references")
    var skipValidation = false
    
    @Option(parsing: .upToNextOption,
            help: "Input directory or directories")
    var input: [String] = []
    
    @Option(help: "Output directory; where generated code will be stored")
    var output: String?
    
}
