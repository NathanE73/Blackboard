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

class BlackboardColorSwiftSourceTests: XCTestCase {
    
    var blackboardColors: [AssetItem<BlackboardColor>] {
        do {
            let colorSets: [AssetItem<ColorSet>] = [
                .asset(try Fixture.colorSet(project: .shared, path: "Dark", name: "Absolute Zero")),
                .asset(try Fixture.colorSet(project: .shared, name: "Bisque")),
                .asset(try Fixture.colorSet(project: .shared, path: "Dark", name: "Charcoal")),
                .asset(try Fixture.colorSet(project: .shared, path: "Dark", name: "dark-olive-green")),
                .asset(try Fixture.colorSet(project: .shared, name: "Desire")),
                .asset(try Fixture.colorSet(project: .shared, name: "Emerald")),
                .asset(try Fixture.colorSet(project: .shared, name: "Empty")),
                .asset(try Fixture.colorSet(project: .shared, path: "Dark", name: "firebrick-color")),
                .namespace("Fluorescent", [
                    .asset(try Fixture.colorSet(project: .shared, namespace: "Fluorescent", name: "Radical Red")),
                    .asset(try Fixture.colorSet(project: .shared, namespace: "Fluorescent", name: "Blizzard Blue")),
                    .asset(try Fixture.colorSet(project: .shared, namespace: "Fluorescent", name: "Magic Mint"))
                ].sorted()),
                .asset(try Fixture.colorSet(project: .shared, path: "Dark", name: "maroon color")),
                .asset(try Fixture.colorSet(project: .shared, path: "Dark", name: "Night"))
            ].sorted()
            
            return colorSets.mapAssets(BlackboardColor.init)
        } catch {
            return []
        }
    }
    
    func testNumberOfColors() {
        XCTAssertEqual(blackboardColors.flatMapAssets().count, 13)
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
            .appendColors(colors: blackboardColors, target: Version(13, 0))
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
