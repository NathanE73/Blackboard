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

class BlackboardColorSwiftSourceTests: XCTestCase {
    
    let factory = ColorSetFactory()
    
    var blackboardColors: [BlackboardColor] {
        let colorSets: [ColorSet?] = [
            factory.colorSet(name: "Absolute Zero", data: AbsoluteZeroColorSetTestData),
            factory.colorSet(name: "Bisque", data: BisqueColorSetTestData),
            factory.colorSet(name: "Charcoal", data: CharcoalColorSetTestData),
            factory.colorSet(name: "dark-olive-green", data: DarkOliveGreenColorSetTestData),
            factory.colorSet(name: "Desire", data: DesireColorSetTestData),
            factory.colorSet(name: "Emerald", data: EmeraldColorSetTestData),
            factory.colorSet(name: "Empty", data: EmptyColorSetTestData),
            factory.colorSet(name: "firebrick-color", data: FirebrickColorSetTestData),
            factory.colorSet(name: "maroon color", data: MaroonColorSetTestData),
            factory.colorSet(name: "Night", data: NightColorSetTestData)
        ]
        
        return colorSets
            .compactMap { $0 }
            .compactMap(BlackboardColor.init)
    }
    
    func testCGColorDescription() {
        let expectedSource = BlackboardCGColorSwiftSourceTestData
        
        let swiftSource = SwiftSource()
        swiftSource.appendCGColors(colors: blackboardColors)
        let source = swiftSource.description
        
        XCTAssertEqual(source, expectedSource)
    }
    
    func testUIColorDescription() {
        let expectedSource = BlackboardUIColorSwiftSourceTestData
        
        let swiftSource = SwiftSource()
        swiftSource.appendUIColors(colors: blackboardColors)
        let source = swiftSource.description
        
        XCTAssertEqual(source, expectedSource)
    }
    
}
