//
// Copyright (c) 2016 Nathan E. Walczak
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

import AppKit

class BlackboardMain {
    
    static func run() {
        
        let arguments = Process.arguments
        let numberOfArguments = arguments.count - 1
        
        // Version
        
        if arguments.contains("--version") {
            print("Blackboard Version #VERSION#")
            exit(0)
        }
        
        // Usage
        
        if numberOfArguments != 2 {
            let name = arguments[0].lastPathComponent
            print("usage: \(name) [--version] source_directory target_directory")
            print("example: \(name) example/storyboards/ example/source/generated")
            exit(1)
        }
        
        // File Manager
        
        let fileManager = NSFileManager.defaultManager()
        
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
        
        // Find Storyboards
        
        let storyboards = Storyboard.storyboardsAt(path: sourceDirectory)
        
        for storyboard in storyboards {
            if let storyboard = BlackboardStoryboard(storyboard: storyboard) {
                let swiftSource = SwiftSource()
                swiftSource.appendStoryboard(storyboard)
                let source = swiftSource.description
                let targetUrl = NSURL(fileURLWithPath: "\(targetDirectory)/\(storyboard.extensionName)")
                try! source.writeToURL(targetUrl, atomically: true, encoding: NSUTF8StringEncoding)
            }
        }
    }
    
}
