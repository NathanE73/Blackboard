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

import Foundation

extension String {
    
    // public var lastPathComponent: String { get }
    public var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    
    // public var deletingLastPathComponent: String { get }
    public var deletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }
    
    // public func appendingPathComponent(str: String) -> String
    public func appendingPathComponent(_ str: String) -> String {
        return (self as NSString).appendingPathComponent(str)
    }
    
    // public var pathExtension: String { get }
    public var pathExtension: String {
        return (self as NSString).pathExtension
    }
    
    // public var deletingPathExtension: String { get }
    public var deletingPathExtension: String {
        return (self as NSString).deletingPathExtension
    }
    
    // public func appendingPathExtension(str: String) -> String?
    public func appendingPathExtension(_ str: String) -> String? {
        return (self as NSString).appendingPathExtension(str)
    }
    
    // public var expandingTildeInPath: String { get }
    public var expandingTildeInPath: String {
        return (self as NSString).expandingTildeInPath
    }
    
}
