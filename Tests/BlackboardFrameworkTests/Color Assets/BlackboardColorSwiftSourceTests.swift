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

class BlackboardColorSwiftSourceTests: XCTestCase {
    
    var blackboardColors: [BlackboardColor] {
        let colorSets: [ColorSet?] = [
            Fixture.colorSet(project: .shared, path: "Dark", name: "Absolute Zero"),
            Fixture.colorSet(project: .shared, name: "Bisque"),
            Fixture.colorSet(project: .shared, path: "Dark", name: "Charcoal"),
            Fixture.colorSet(project: .shared, path: "Dark", name: "dark-olive-green"),
            Fixture.colorSet(project: .shared, name: "Desire"),
            Fixture.colorSet(project: .shared, name: "Emerald"),
            Fixture.colorSet(project: .shared, name: "Empty"),
            Fixture.colorSet(project: .shared, path: "Dark", name: "firebrick-color"),
            Fixture.colorSet(project: .shared, name: "Fluorescent/Blizzard Blue"),
            Fixture.colorSet(project: .shared, name: "Fluorescent/Magic Mint"),
            Fixture.colorSet(project: .shared, name: "Fluorescent/Radical Red"),
            Fixture.colorSet(project: .shared, path: "Dark", name: "maroon color"),
            Fixture.colorSet(project: .shared, path: "Dark", name: "Night")
        ]
        
        var blackboardColors = colorSets
            .compactMap { $0 }
            .compactMap(BlackboardColor.init)
        
        blackboardColors.sort { $0.caseName.localizedCaseInsensitiveCompare($1.caseName) == .orderedAscending }
        
        return blackboardColors
    }
    
    func testNumberOfColors() {
        XCTAssertEqual(blackboardColors.count, 13)
    }
    
    func testColorAssetSource() {
        let expectedSource = Fixture.generated(project: .example, name: "ColorAsset")
        
        let source = SwiftSource()
            .appendColorAssets(colors: blackboardColors)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
    func testColorSource() {
        let expectedSource = Fixture.generated(project: .example, name: "Color")
        
        let source = SwiftSource()
            .appendColors(colors: blackboardColors)
            .source
        
        XCTAssertEqual(source, expectedSource)
    }
    
    func testCGColorSource() {
        let expectedSource = Fixture.generated(project: .example, name: "CGColor")
        
        let source = SwiftSource()
            .appendCGColors(colors: blackboardColors)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
    func testUIColorSource() {
        let expectedSource = Fixture.generated(project: .example, name: "UIColor")
        
        let source = SwiftSource()
            .appendUIColors(colors: blackboardColors)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
}
