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

extension SwiftSource {
    
    // MARK: Data Assets
    
    func appendDataAssets(data: [BlackboardData]) -> Self {
        appendHeading(filename: Filename.DataAsset, modules: ["Foundation"])
        append("public enum DataAsset: String") {
            data.forEach { data in
                if data.caseName == data.name {
                    append("case \(data.caseName)")
                } else {
                    append("case \(data.caseName) = \"\(data.name)\"")
                }
            }
        }
        append()
        
        return self
    }
    
    // MARK: NSDataAsset
    
    func appendNSDataAsset(data: [BlackboardData]) -> Self {
        appendHeading(filename: Filename.NSDataAsset, modules: ["UIKit"], includeBundle: true)
        append("public extension DataAsset") {
            append("var dataAsset: NSDataAsset { return NSDataAsset(asset: self) }")
            append("var data: Data { return dataAsset.data }")
        }
        append()
        append("public extension NSDataAsset") {
            append()
            append("convenience init(asset dataAsset: DataAsset)") {
                append("self.init(name: dataAsset.rawValue, bundle: bundle)!")
            }
            append()
        }
        append()
        append("public extension Data") {
            append()
            append("init(asset dataAsset: DataAsset)") {
                append("self = dataAsset.data")
            }
            append()
        }
        append()
        
        return self
    }
    
}
