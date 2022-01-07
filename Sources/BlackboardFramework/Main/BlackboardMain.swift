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

// swiftlint:disable:next type_body_length
public struct BlackboardMain {
    
    struct PlatformConfiguration {
        var target: Version
        var sdk: Version
    }
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
    
    struct LocalizableConfiguration {
        var base: String
        var useMainBundle: Bool
        var includeKeys: [String]
        var excludeKeys: [String]
    }
    var localizable: LocalizableConfiguration
    
    init(_ command: BlackboardCommand, _ configuration: BlackboardConfiguration?) throws {
        ios = PlatformConfiguration(
            target: configuration?.ios?.target ?? Version(13, 0),
            sdk: configuration?.ios?.sdk ?? Version(14, 5)
        )
        
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
        
        self.localizable = LocalizableConfiguration(
            base: configuration?.localizable?.base ?? "en",
            useMainBundle: configuration?.localizable?.useMainBundle ?? false,
            includeKeys: configuration?.localizable?.includeKeys ?? [],
            excludeKeys: configuration?.localizable?.excludeKeys ?? []
        )
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
    
    private func processSymbols(_ symbols: Set<String>, _ output: String) {
        guard !skipSymbols else { return }
        
        var blackboardSymbols = BlackboardSymbolFactory()
            .symbols(for: symbols)
        blackboardSymbols.sort { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        guard !blackboardSymbols.isEmpty else {
            return
        }
        
        if !skipSwiftUI || !skipUIKit {
            SwiftSourceFile(Filename.SymbolAsset, at: output)
                .appendSymbolAssets(symbols: blackboardSymbols, target: ios.target)
                .write()
        }
        
        if !skipSwiftUI {
            SwiftSourceFile(Filename.SymbolImage, at: output)
                .appendSymbolImages(symbols: blackboardSymbols, target: ios.target, sdk: ios.sdk)
                .write()
        }
        
        if !skipUIKit {
            SwiftSourceFile(Filename.SymbolUIImage, at: output)
                .appendSymbolUIImages(symbols: blackboardSymbols, target: ios.target)
                .write()
        }
    }
    
    private func processStoryboards(_ input: [String], _ output: String) -> [Storyboard] {
        guard !skipStoryboards else { return [] }
        
        let storyboards = Storyboard.storyboardsAt(paths: input)
        
        var storyboardExtensionsWereGenerated = false
        
        for storyboard in storyboards {
            if let storyboard = BlackboardStoryboard(storyboard, storyboards: storyboards) {
                storyboardExtensionsWereGenerated = true
                SwiftSourceFile(storyboard.extensionFilename, at: output)
                    .appendStoryboard(storyboard)
                    .write()
            }
        }
        
        // UIKit
        
        if storyboardExtensionsWereGenerated {
            SwiftSourceFile(Filename.UIKit, at: output)
                .append(source: UIKitSwiftSource)
                .write()
        }
        
        return storyboards
    }
    
    private func processColors(_ input: [String], _ output: String) -> [ColorSet] {
        guard !skipColors else { return [] }
        
        let colorSets = ColorSetFactory().colorSetsAt(paths: input)
        
        var blackboardColors = colorSets.compactMap(BlackboardColor.init)
        blackboardColors.sort { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        guard !blackboardColors.isEmpty else {
            return []
        }
        
        if !skipSwiftUI || !skipUIKit {
            SwiftSourceFile(Filename.ColorAsset, at: output)
                .appendColorAssets(colors: blackboardColors)
                .write()
            
            SwiftSourceFile(Filename.CGColor, at: output)
                .appendCGColors(colors: blackboardColors)
                .write()
        }
        
        if !skipSwiftUI {
            SwiftSourceFile(Filename.Color, at: output)
                .appendColors(colors: blackboardColors, target: ios.target)
                .write()
        }
        
        if !skipUIKit {
            SwiftSourceFile(Filename.UIColor, at: output)
                .appendUIColors(colors: blackboardColors)
                .write()
        }
        
        return colorSets
    }
    
    private func processDataAssets(_ input: [String], _ output: String) {
        guard !skipDataAssets else { return }
        
        let dataSets = DataSetFactory().dataSetsAt(paths: input)
        
        let blackboardData = dataSets.compactMap(BlackboardData.init)
            .sorted { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        guard !blackboardData.isEmpty else {
            return
        }
        
        SwiftSourceFile(Filename.DataAsset, at: output)
            .appendDataAssets(data: blackboardData)
            .write()
        
        SwiftSourceFile(Filename.NSDataAsset, at: output)
            .appendNSDataAsset(data: blackboardData)
            .write()
    }
    
    private func processImages(_ input: [String], _ output: String) -> [ImageSet] {
        guard !skipImages else { return [] }
        
        let imageSets = ImageSetFactory().imageSetsAt(paths: input)
        
        let blackboardImages = imageSets.compactMap(BlackboardImage.init)
            .sorted { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        guard !blackboardImages.isEmpty else {
            return []
        }
        
        if !skipSwiftUI || !skipUIKit {
            SwiftSourceFile(Filename.ImageAsset, at: output)
                .appendImageAssets(images: blackboardImages)
                .write()
        }
        
        if !skipSwiftUI {
            SwiftSourceFile(Filename.Image, at: output)
                .appendImages(images: blackboardImages, target: ios.target, sdk: ios.sdk)
                .write()
        }
        
        if !skipUIKit {
            SwiftSourceFile(Filename.UIImage, at: output)
                .appendUIImages(images: blackboardImages)
                .write()
        }
        
        return imageSets
    }
    
    func processLocalizable(_ input: [String], _ output: String) -> [BlackboardLocalizable] {
        guard !skipLocalizable else { return [] }
        
        let localizables = LocalizableFactory().localizablesAt(paths: input).sorted {
            $0.localeCode == localizable.base ||
            $0.localeDescription.localizedCaseInsensitiveCompare($1.localeDescription) == .orderedAscending
        }
        
        let blackboardLocalizables = localizables.blackboardLocalizables.sorted {
            $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending
        }
        
        guard !blackboardLocalizables.isEmpty else { return [] }
        
        SwiftSourceFile(Filename.Localizable, at: output)
            .appendLocalizable(
                localizables: blackboardLocalizables,
                useMainBundle: localizable.useMainBundle)
            .write()
        
        return blackboardLocalizables
    }
    
    func valiateStoryboards(_ storyboards: [Storyboard], _ colorSets: [ColorSet], _ imageSets: [ImageSet]) {
        guard !skipValidation && !skipStoryboardValidation else { return }
        
        let knownNamedColors = Set(colorSets.map(\.name))
        let knownNamedImages = Set(imageSets.map(\.name))
        
        storyboards.forEach { storyboard in
            if !skipColors {
                Set(storyboard.namedColorResources)
                    .subtracting(knownNamedColors)
                    .forEach { missing in
                        print("\(storyboard.file): warning: '\(storyboard.name).storyboard' references missing color named: '\(missing)'")
                    }
            }
            if !skipImages {
                Set(storyboard.namedImageResources)
                    .subtracting(knownNamedImages)
                    .forEach { missing in
                        print("\(storyboard.file): warning: '\(storyboard.name).storyboard' references missing image named: '\(missing)'")
                    }
            }
        }
    }
    
    func valiateNibs(_ input: [String], _ colorSets: [ColorSet], _ imageSets: [ImageSet]) {
        guard !skipValidation && !skipNibValidation else { return }
        
        let nibs = Nib.nibsAt(paths: input)
        
        let knownNamedColors = Set(colorSets.map(\.name))
        let knownNamedImages = Set(imageSets.map(\.name))
        
        nibs.forEach { nib in
            if !skipColors {
                Set(nib.namedColorResources)
                    .subtracting(knownNamedColors)
                    .forEach { missing in
                        print("\(nib.file): warning: '\(nib.name).xib' references missing color named: '\(missing)'")
                    }
            }
            if !skipImages {
                Set(nib.namedImageResources)
                    .subtracting(knownNamedImages)
                    .forEach { missing in
                        print("\(nib.file): warning: '\(nib.name).xib' references missing image named: '\(missing)'")
                    }
            }
        }
    }
    
    func validateLocalizables(_ localizables: [BlackboardLocalizable]) {
        guard !skipValidation && !skipLocalizableValidation else { return }
        
    }
    
}
