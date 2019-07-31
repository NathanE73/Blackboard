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

class SwiftSourceFile: SwiftSource {
    
    let filename: String
    let path: String
    
    init(_ filename: String, at path: String) {
        self.filename = filename
        self.path = path
    }
    
    private func read(from url: URL) -> String? {
        do {
            let data = try Data(contentsOf: url)
            return String(data: data, encoding: .utf8)
        } catch {
            print("error: Failed to read: \(filename)")
            exit(1)
        }
    }
    
    private func write(_ source: String, to url: URL) {
        do {
            try source.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print("error: Failed to write: \(filename)")
        }
    }
    
    func write() {
        let source = self.source
        
        let targetPath = "\(path)/\(filename)"
        let targetUrl = URL(fileURLWithPath: targetPath)
        
        let targetExists = FileManager.default.isFile(targetPath)
        if targetExists {
            let existingSource = read(from: targetUrl)
            if source == existingSource {
                print("Skipping: \(filename)")
            } else {
                print("Updating: \(filename)")
                write(source, to: targetUrl)
            }
        } else {
            print("Creating: \(filename)")
            write(source, to: targetUrl)
        }
    }
    
}
