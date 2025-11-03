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

class BlackboardDataSwiftSourceTests: XCTestCase {
    
    var blackboardData: [AssetItem<BlackboardData>] {
        do {
            let dataSets: [AssetItem<DataSet>] = [
                .namespace("Level", [
                    .asset(try Fixture.dataSet(project: .shared, namespace: "Level", name: "N002")),
                    .asset(try Fixture.dataSet(project: .shared, namespace: "Level", name: "N001"))
                ].sorted()),
                .asset(try Fixture.dataSet(project: .shared, name: "Welcome Message")),
                .asset(try Fixture.dataSet(project: .shared, name: "Names"))
            ].sorted()

            return dataSets.mapAssets(BlackboardData.init)
        } catch {
            return []
        }
    }
    
    func testNumberOfData() {
        XCTAssertEqual(blackboardData.flatMapAssets().count, 4)
    }
    
    func testDataAssetSource() {
        let expectedSource = Fixture.generated(project: .declarative, name: "DataAsset")
        
        let source = SwiftSource()
            .appendDataAssets(data: blackboardData)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
    func testNSDataAssetSource() {
        let expectedSource = Fixture.generated(project: .declarative, name: "NSDataAsset")
        
        let source = SwiftSource()
            .appendNSDataAsset(data: blackboardData)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
}
