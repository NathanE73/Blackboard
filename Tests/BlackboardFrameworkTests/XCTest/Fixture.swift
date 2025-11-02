//
// Copyright (c) 2022 Nathan E. Walczak
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

import XCTest
@testable import BlackboardFramework

enum FixtureError: Error {
    case missingResource
}

class Fixture {
    
    enum Project {
        case declarative
        case shared
        
        var path: String {
            switch self {
            case .declarative:
                return "DeclarativeApp"
            case .shared:
                return "Shared"
            }
        }
    }
    
    static func generated(project: Project, path: String? = nil, name: String, file: StaticString = #file, line: UInt = #line) -> String? {
        let path = "\(project.path)/Source/Generated/\(name).blackboard.swift"
        
        guard let data = fixture(path, file: file, line: line) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    static func colorSet(project: Project, path: String? = nil, namespace: String? = nil, name: String, file: StaticString = #file, line: UInt = #line) throws -> ColorSet {
        let path = "\(project.path)/Resources/Colors.xcassets/\(path ?? ".")/\(namespace ?? "")/\(name).colorset/Contents.json"
        
        if let data = fixture(path, file: file, line: line),
           let colorSet = ColorSetFactory().asset(namespace: namespace, name: name, data: data) {
            return colorSet
        }
        
        throw FixtureError.missingResource
    }
    
    static func dataSet(project: Project, path: String? = nil, namespace: String? = nil, name: String, file: StaticString = #file, line: UInt = #line) throws-> DataSet {
        let path = "\(project.path)/Resources/Data.xcassets/\(path ?? ".")/\(namespace ?? "")/\(name).dataset/Contents.json"
        
        if let data = fixture(path, file: file, line: line),
           let dataSet = DataSetFactory().asset(namespace: namespace, name: name, data: data){
            return dataSet
        }
        
        throw FixtureError.missingResource
    }
    
    static func imageSet(project: Project, path: String? = nil, namespace: String? = nil, name: String, file: StaticString = #file, line: UInt = #line) throws-> ImageSet {
        let path = "\(project.path)/Resources/Images.xcassets/\(path ?? ".")/\(namespace ?? "")/\(name).imageset/Contents.json"
        
        if let data = fixture(path, file: file, line: line),
           let imageSet = ImageSetFactory().asset(namespace: namespace, name: name, data: data) {
            return imageSet
        }
        
        throw FixtureError.missingResource
    }
    
}

private func fixture(_ path: String, file: StaticString = #file, line: UInt = #line) -> Data? {
    // .../Tests/BlackboardTests/XCTest/XCTestCase.swift
    let fullPath = (#file)
        .deletingLastPathComponent // remove XCTestCase.swift
        .deletingLastPathComponent // remove XCTest
        .deletingLastPathComponent // remove BlackboardTests
        .deletingLastPathComponent // remove Tests
        .appendingPathComponent(path)
    
    let url = URL(fileURLWithPath: fullPath, isDirectory: false)
    
    guard let data = try? Data(contentsOf: url) else {
        XCTFail("Unable to read file: \"\(path)\"", file: file, line: line)
        return nil
    }
    
    return data
}
