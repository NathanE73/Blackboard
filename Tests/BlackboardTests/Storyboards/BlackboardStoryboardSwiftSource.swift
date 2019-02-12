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

@testable import Blackboard

class BlackboardStoryboardSwiftSource: XCTestCase {
    
    var collectionStoryboard: Storyboard?
    var mainStoryboard: Storyboard?
    var navigationStoryboard: Storyboard?
    var tableStoryboard: Storyboard?
    
    var storyboards: [Storyboard] = []
    
    override func setUp() {
        collectionStoryboard = Storyboard(name: "Collection", data: CollectionStoryboardTestData)
        mainStoryboard = Storyboard(name: "Main", data: MainStoryboardTestData)
        navigationStoryboard = Storyboard(name: "Navigation", data: NavigationStoryboardTestData)
        tableStoryboard = Storyboard(name: "Table", data: TableStoryboardTestData)
        
        storyboards = [
            collectionStoryboard,
            mainStoryboard,
            navigationStoryboard,
            tableStoryboard
            ].compactMap { $0 }
    }
    
    func testCollectionStoryboard() {
        let expectedSource = CollectionStoryboardSwiftSourceTestData
        
        guard let collectionStoryboard = collectionStoryboard,
            let storyboard = BlackboardStoryboard(collectionStoryboard, storyboards: storyboards) else {
                XCTFail("Unable to decode storyboard data")
                return
        }
        
        let swiftSource = SwiftSource()
        swiftSource.appendStoryboard(storyboard)
        let source = swiftSource.description
        
        XCTAssertEqual(source, expectedSource)
    }
    
    func testMainStoryboard() {
        let expectedSource = MainStoryboardSwiftSourceTestData
        
        guard let mainStoryboard = mainStoryboard,
            let storyboard = BlackboardStoryboard(mainStoryboard, storyboards: storyboards) else {
                XCTFail("Unable to decode storyboard data")
                return
        }
        
        let swiftSource = SwiftSource()
        swiftSource.appendStoryboard(storyboard)
        let source = swiftSource.description
        
        XCTAssertEqual(source, expectedSource)
    }
    func testNavigationStoryboard() {
        let expectedSource = NavigationStoryboardSwiftSourceTestData
        
        guard let navigationStoryboard = navigationStoryboard,
            let storyboard = BlackboardStoryboard(navigationStoryboard, storyboards: storyboards) else {
                XCTFail("Unable to decode storyboard data")
                return
        }
        
        let swiftSource = SwiftSource()
        swiftSource.appendStoryboard(storyboard)
        let source = swiftSource.description
        
        XCTAssertEqual(source, expectedSource)
    }
    
    
    func testTableStoryboard() {
        let expectedSource = TableStoryboardSwiftSourceTestData
        
        guard let tableStoryboard = tableStoryboard,
            let storyboard = BlackboardStoryboard(tableStoryboard, storyboards: storyboards) else {
                XCTFail("Unable to decode storyboard data")
                return
        }
        
        let swiftSource = SwiftSource()
        swiftSource.appendStoryboard(storyboard)
        let source = swiftSource.description
        
        XCTAssertEqual(source, expectedSource)
    }
    
}
