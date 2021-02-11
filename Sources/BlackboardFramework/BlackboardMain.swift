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

public struct BlackboardMain: ParsableCommand {
    
    public static var configuration = CommandConfiguration(commandName: "blackboard")
    
    @Flag(name: [.short, .long],
          help: "Print the version numbers of Blackboard.")
    var version = false
    
    @Flag(help: "Skip generating storyboard extensions (UIStoryboard)")
    var skipStoryboards = false
    
    @Flag(help: "Skip generating color extensions (Color, CGColor, and UIColor)")
    var skipColors = false
    
    @Flag(help: "Skip generating data asset extensions (NSDataAsset)")
    var skipDataAssets = false
    
    @Flag(help: "Skip generating image extensions (Image, UIImage)")
    var skipImages = false
    
    @Flag(name: .customLong("skip-swiftui"),
          help: "Skip generating SwiftUI extensions (Color, Image)")
    var skipSwiftUI = false
    
    @Option(name: [.customShort("i"), .customLong("input")],
            parsing: .upToNextOption,
            help: "Input directory / directories")
    var sourceDirectories: [String] = []
    
    @Option(name: [.customShort("o"), .customLong("output")],
            help: "Output directory; where generated code will be stored")
    var targetDirectory: String?
    
    public init() {
    }
    
    public mutating func run() throws {
        guard version == false else {
            print(Self.version)
            return
        }
        
        guard !sourceDirectories.isEmpty,
            let targetDirectory = targetDirectory else {
                print(Self.helpMessage())
                throw ExitCode.validationFailure
        }
        
        // File Manager
        
        let fileManager = FileManager.default
        
        // Source Directories
        
        try sourceDirectories.forEach { sourceDirectory in
            guard fileManager.isDirectory(sourceDirectory) else {
                print("No such source directory: \(sourceDirectory)")
                throw ExitCode.validationFailure
            }
            
            print("Source directory: \(sourceDirectory)")
        }
        
        // Target Directory
        
        guard fileManager.isDirectory(targetDirectory) else {
            print("No such target directory: \(targetDirectory)")
            throw ExitCode.validationFailure
        }
        
        print("Target directory: \(targetDirectory)")
        
        // Process Resources
        
        let storyboards = processStoryboards(sourceDirectories, targetDirectory)
        let colorSets = processColors(sourceDirectories, targetDirectory)
        processDataAssets(sourceDirectories, targetDirectory)
        let imageSets = processImages(sourceDirectories, targetDirectory)
        
        // Validate Storyboard Resources
        
        let knownNamedColors = Set(colorSets.map(\.name))
        let knownNamedImages = Set(imageSets.map(\.name))
        
        storyboards.forEach { storyboard in
            if !skipColors {
                Set(storyboard.namedColorResources)
                    .subtracting(knownNamedColors)
                    .forEach { missing in
                        print("\(storyboard.file): warning: '\(storyboard.name).storyboard' references missing color named : '\(missing)'")
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
    
    private func processStoryboards(_ sourceDirectories: [String], _ targetDirectory: String) -> [Storyboard] {
        guard !skipStoryboards else { return [] }
        
        let storyboards = Storyboard.storyboardsAt(paths: sourceDirectories)
        
        var storyboardExtensionsWereGenerated = false
        
        for storyboard in storyboards {
            if let storyboard = BlackboardStoryboard(storyboard, storyboards: storyboards) {
                storyboardExtensionsWereGenerated = true
                SwiftSourceFile(storyboard.extensionFilename, at: targetDirectory)
                    .appendStoryboard(storyboard)
                    .write()
            }
        }
        
        // UIKit
        
        if storyboardExtensionsWereGenerated {
            SwiftSourceFile(Filename.UIKit, at: targetDirectory)
                .append(source: UIKitSwiftSource)
                .write()
        }
        
        return storyboards
    }
    
    private func processColors(_ sourceDirectories: [String], _ targetDirectory: String) -> [ColorSet] {
        guard !skipColors else { return [] }
        
        let colorSets = ColorSetFactory().colorSetsAt(paths: sourceDirectories)
        
        var blackboardColors = colorSets.compactMap(BlackboardColor.init)
        blackboardColors.sort { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        guard !blackboardColors.isEmpty else {
            return []
        }
        
        SwiftSourceFile(Filename.ColorAsset, at: targetDirectory)
            .appendColorAssets(colors: blackboardColors)
            .write()
        
        if !skipSwiftUI {
            SwiftSourceFile(Filename.Color, at: targetDirectory)
                .appendColors(colors: blackboardColors)
                .write()
        }
        
        SwiftSourceFile(Filename.CGColor, at: targetDirectory)
            .appendCGColors(colors: blackboardColors)
            .write()
        
        SwiftSourceFile(Filename.UIColor, at: targetDirectory)
            .appendUIColors(colors: blackboardColors)
            .write()
        
        return colorSets
    }
    
    private func processDataAssets(_ sourceDirectories: [String], _ targetDirectory: String) {
        guard !skipDataAssets else { return }
        
        let dataSets = DataSetFactory().dataSetsAt(paths: sourceDirectories)
        
        let blackboardData = dataSets.compactMap(BlackboardData.init)
            .sorted { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        guard !blackboardData.isEmpty else {
            return
        }
        
        SwiftSourceFile(Filename.DataAsset, at: targetDirectory)
            .appendDataAssets(data: blackboardData)
            .write()
        
        SwiftSourceFile(Filename.NSDataAsset, at: targetDirectory)
            .appendNSDataAsset(data: blackboardData)
            .write()
    }
    
    private func processImages(_ sourceDirectories: [String], _ targetDirectory: String) -> [ImageSet] {
        guard !skipImages else { return [] }
        
        let imageSets = ImageSetFactory().imageSetsAt(paths: sourceDirectories)
        
        let blackboardImages = imageSets.compactMap(BlackboardImage.init)
            .sorted { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        guard !blackboardImages.isEmpty else {
            return []
        }
        
        SwiftSourceFile(Filename.ImageAsset, at: targetDirectory)
            .appendImageAssets(images: blackboardImages)
            .write()
        
        if !skipSwiftUI {
            SwiftSourceFile(Filename.Image, at: targetDirectory)
                .appendImages(images: blackboardImages)
                .write()
        }
        
        SwiftSourceFile(Filename.UIImage, at: targetDirectory)
            .appendUIImages(images: blackboardImages)
            .write()
        
        return imageSets
    }
    
}
