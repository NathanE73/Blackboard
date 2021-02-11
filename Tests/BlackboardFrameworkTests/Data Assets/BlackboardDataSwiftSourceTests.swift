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

import XCTest

@testable import BlackboardFramework

class BlackboardDataSwiftSourceTests: XCTestCase {
    
    var blackboardData: [BlackboardData] {
        let dataSets: [DataSet?] = [
            Fixture.dataSet(project: .example, name: "Level/001"),
            Fixture.dataSet(project: .example, name: "Level/002"),
            Fixture.dataSet(project: .example, name: "Names"),
            Fixture.dataSet(project: .example, name: "Welcome Message")
        ]
        
        var blackboardData = dataSets
            .compactMap { $0 }
            .compactMap(BlackboardData.init)
        
        blackboardData.sort { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        return blackboardData
    }
    
    func testNumberOfData() {
        XCTAssertEqual(blackboardData.count, 4)
    }
    
    func testDataAssetSource() {
        let expectedSource = Fixture.generated(project: .example, name: "DataAsset")
        
        let source = SwiftSource()
            .appendDataAssets(data: blackboardData)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
    func testNSDataAssetSource() {
        let expectedSource = Fixture.generated(project: .example, name: "NSDataAsset")
        
        let source = SwiftSource()
            .appendNSDataAsset(data: blackboardData)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
}
