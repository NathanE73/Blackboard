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
            print("\(sourceDirectory): No such source directory")
            exit(1)
        }
        
        // Target Directory
        
        let targetDirectory = arguments[numberOfArguments]
        
        if !fileManager.isDirectory(targetDirectory) {
            print("\(targetDirectory): No such target directory")
            exit(1)
        }
        
        // UIKit
        
        let uiKitTargetUrl = URL(fileURLWithPath: "\(targetDirectory)/\(Filename.uiKit)")
        try! UIKitSwiftSource.write(to: uiKitTargetUrl, atomically: true, encoding: .utf8)
        
        // Process Storyboards
        
        let storyboards = Storyboard.storyboardsAt(path: sourceDirectory)
        
        for storyboard in storyboards {
            if let storyboard = BlackboardStoryboard(storyboard, storyboards: storyboards) {
                let swiftSource = SwiftSource()
                swiftSource.appendStoryboard(storyboard)
                let source = swiftSource.description
                let targetUrl = URL(fileURLWithPath: "\(targetDirectory)/\(storyboard.extensionName)")
                try! source.write(to: targetUrl, atomically: true, encoding: .utf8)
            }
        }
        
        // Process Color Sets
        
        let colorSets = ColorSetFactory().colorSetsAt(path: sourceDirectory)
        
        let blackboardColors = colorSets.compactMap(BlackboardColor.init)
        
        if !blackboardColors.isEmpty {
            let swiftSource = SwiftSource()
            swiftSource.appendCGColors(colors: blackboardColors)
            let source = swiftSource.description
            let targetUrl = URL(fileURLWithPath: "\(targetDirectory)/\(Filename.cgColor)")
            try! source.write(to: targetUrl, atomically: true, encoding: .utf8)
        }
        
        if !blackboardColors.isEmpty {
            let swiftSource = SwiftSource()
            swiftSource.appendUIColors(colors: blackboardColors)
            let source = swiftSource.description
            let targetUrl = URL(fileURLWithPath: "\(targetDirectory)/\(Filename.uiColor)")
            try! source.write(to: targetUrl, atomically: true, encoding: .utf8)
        }
        
        // Process Image Sets
        
        let imageSets = ImageSetFactory().imageSetsAt(path: sourceDirectory)
        
        let blackboardImages = imageSets.compactMap(BlackboardImage.init)
        
        if !blackboardImages.isEmpty {
            let swiftSource = SwiftSource()
            swiftSource.appendImages(images: blackboardImages)
            let source = swiftSource.description
            let targetUrl = URL(fileURLWithPath: "\(targetDirectory)/\(Filename.uiImage)")
            try! source.write(to: targetUrl, atomically: true, encoding: .utf8)
        }
        
    }
    
}
