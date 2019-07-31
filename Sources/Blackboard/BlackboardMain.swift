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

import Foundation

public class BlackboardMain {
    
    static func printUsage() {
        let name = CommandLine.arguments[0].lastPathComponent
        print("usage: \(name) --version")
        print("usage: \(name) source_directory target_directory")
        print("example: \(name) ExampleApp/Resources/ ExampleApp/Source/Generated")
    }
    
    public static func run() {
        
        let arguments = CommandLine.arguments
        let numberOfArguments = arguments.count - 1
        
        // Version
        
        if arguments.contains("--version") {
            print("Blackboard Version \(version)")
            exit(0)
        }
        
        // Usage
        
        if numberOfArguments != 2 {
            printUsage()
            exit(1)
        }
        
        // File Manager
        
        let fileManager = FileManager.default
        
        // Source Directory
        
        let sourceDirectory = arguments[numberOfArguments - 1]
        
        if !fileManager.isDirectory(sourceDirectory) {
            print("No such source directory: \(sourceDirectory)")
            exit(1)
        }
        
        print("Source directory: \(sourceDirectory)")
        
        // Target Directory
        
        let targetDirectory = arguments[numberOfArguments]
        
        if !fileManager.isDirectory(targetDirectory) {
            print("No such target directory: \(targetDirectory)")
            exit(1)
        }
        
        print("Target directory: \(targetDirectory)")
        
        // UIKit
        
        SwiftSourceFile(Filename.UIKit, at: targetDirectory)
            .append(source: UIKitSwiftSource)
            .write()
        
        // Process Storyboards
        
        let storyboards = Storyboard.storyboardsAt(path: sourceDirectory)
        
        for storyboard in storyboards {
            if let storyboard = BlackboardStoryboard(storyboard, storyboards: storyboards) {
                SwiftSourceFile(storyboard.extensionFilename, at: targetDirectory)
                    .appendStoryboard(storyboard)
                    .write()
            }
        }
        
        // Process Color Sets
        
        let colorSets = ColorSetFactory().colorSetsAt(path: sourceDirectory)
        
        var blackboardColors = colorSets.compactMap(BlackboardColor.init)
        blackboardColors.sort { $0.functionName.localizedCaseInsensitiveCompare($1.functionName) == .orderedAscending }
        
        if !blackboardColors.isEmpty {
            SwiftSourceFile(Filename.ColorAsset, at: targetDirectory)
                .appendColorAssets(colors: blackboardColors)
                .write()
            SwiftSourceFile(Filename.CGColor, at: targetDirectory)
                .appendCGColors(colors: blackboardColors)
                .write()
            SwiftSourceFile(Filename.UIColor, at: targetDirectory)
                .appendUIColors(colors: blackboardColors)
                .write()
        }
        
        // Process Image Sets
        
        let imageSets = ImageSetFactory().imageSetsAt(path: sourceDirectory)
        
        let blackboardImages = imageSets.compactMap(BlackboardImage.init)
            .sorted { $0.functionName.localizedCaseInsensitiveCompare($1.functionName) == .orderedAscending }
        
        if !blackboardImages.isEmpty {
            SwiftSourceFile(Filename.ImageAsset, at: targetDirectory)
                .appendImageAssets(images: blackboardImages)
                .write()
            SwiftSourceFile(Filename.UIImage, at: targetDirectory)
                .appendUIImages(images: blackboardImages)
                .write()
        }
        
    }
    
}
