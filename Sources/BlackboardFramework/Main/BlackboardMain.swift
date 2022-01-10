//
// Copyright (c) 2019 Nathan E. Walczak
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

public struct BlackboardMain {
    
    var configurationFile: String
    
    var ios: PlatformConfiguration
    
    var input: [String]
    
    var output: String
    
    var symbols: Set<String>
    
    var skipColors: Bool
    var skipDataAssets: Bool
    var skipImages: Bool
    var skipLocalizable: Bool
    var skipLocalizableValidation: Bool
    var skipNibValidation: Bool
    var skipStoryboards: Bool
    var skipStoryboardValidation: Bool
    var skipSwiftUI: Bool
    var skipSymbols: Bool
    var skipUIKit: Bool
    var skipValidation: Bool
    
    var localizable: LocalizableConfiguration
    
    init(_ command: BlackboardCommand, _ configuration: BlackboardConfiguration?) throws {
        configurationFile = configuration?.file ?? ""
        
        ios = PlatformConfiguration(using: configuration)
        
        if !command.input.isEmpty {
            self.input = command.input
        } else if let input = configuration?.input, !input.isEmpty {
            self.input = input
        } else {
            throw BlackboardError.missingInput
        }
        
        if let output = command.output ?? configuration?.output {
            self.output = output
        } else {
            throw BlackboardError.missingOutput
        }
        
        self.symbols = configuration?.symbols ?? []
        
        let skips = configuration?.skips ?? []
        self.skipColors = command.skipColors || skips.contains(.colors)
        self.skipDataAssets = command.skipDataAssets || skips.contains(.dataAssets)
        self.skipImages = command.skipImages || skips.contains(.images)
        self.skipLocalizable = command.skipLocalizable || skips.contains(.localizable)
        self.skipLocalizableValidation = command.skipLocalizableValidation || skips.contains(.localizableValidation)
        self.skipNibValidation = command.skipNibValidation || skips.contains(.nibValidation)
        self.skipStoryboards = command.skipStoryboards || skips.contains(.storyboards)
        self.skipStoryboardValidation = command.skipStoryboardValidation || skips.contains(.storyboardValidation)
        self.skipSwiftUI = command.skipSwiftUI || skips.contains(.swiftui)
        self.skipSymbols = command.skipSymbols || skips.contains(.symbols)
        self.skipUIKit = command.skipUIKit || skips.contains(.uikit)
        self.skipValidation = command.skipValidation || skips.contains(.validation)
        
        self.localizable = try LocalizableConfiguration(using: configuration)
    }
    
    public static func main() {
        do {
            let command = BlackboardCommand.parseOrExit()
            
            let configuration: BlackboardConfiguration?
            if let config = command.config {
                configuration = try BlackboardConfiguration(file: config)
            } else {
                configuration = try BlackboardConfiguration(path: FileManager.default.currentDirectoryPath)
            }
            
            let main = try BlackboardMain(command, configuration)
            try main.run()
        } catch {
            print(error)
            exit(64)
        }
    }
    
    func run() throws {
        let fileManager = FileManager.default
        
        // Verify Input Directories
        
        try input.forEach { input in
            guard fileManager.isDirectory(input) else {
                throw BlackboardError.invalidInputDirectory(directory: input)
            }
            print("Input: \(input)")
        }
        
        // Verify Output Directory
        
        guard fileManager.isDirectory(output) else {
            throw BlackboardError.invalidOutputDirectory(directory: output)
        }
        
        print("Output: \(output)")
        
        // Platform Configuration
        
        print("iOS Deployment Target: \(ios.target)")
        print("iOS SDK: \(ios.sdk)")
        
        // Process Symbols
        
        processSymbols(symbols, output)
        
        // Process Resources
        
        let storyboards = processStoryboards(input, output)
        let colorSets = processColors(input, output)
        processDataAssets(input, output)
        let imageSets = processImages(input, output)
        let localizables = processLocalizable(input, output)
        
        // Validate Storyboard Resources
        
        valiateStoryboards(storyboards, colorSets, imageSets)
        
        // Valiate Nib Resources
        
        valiateNibs(input, colorSets, imageSets)
        
        // Validate Localizable Resources
        
        validateLocalizables(localizables)
    }
    
}
