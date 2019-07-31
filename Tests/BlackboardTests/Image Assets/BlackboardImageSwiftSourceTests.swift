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

class BlackboardImageSwiftSourceTests: XCTestCase {
    
    var blackboardImages: [BlackboardImage] {
        let imageSets: [ImageSet?] = [
            Fixture.imageSet(project: .example, name: "button"),
            Fixture.imageSet(project: .example, path: "Paper Clips", name: "green-paper-clip"),
            Fixture.imageSet(project: .example, name: "green-pencil"),
            Fixture.imageSet(project: .example, name: "Red/cup"),
            Fixture.imageSet(project: .example, name: "Red/stapler"),
            Fixture.imageSet(project: .example, path: "Paper Clips", name: "silver-paper-clip"),
            Fixture.imageSet(project: .example, name: "white-dice")
        ]
        
        var blackboardImages = imageSets
            .compactMap { $0 }
            .compactMap(BlackboardImage.init)
        
        blackboardImages.sort { $0.functionName.localizedCaseInsensitiveCompare($1.functionName) == .orderedAscending }
        
        return blackboardImages
    }
    
    func testNumberOfImages() {
        XCTAssertEqual(blackboardImages.count, 7)
    }
    
    func testImageAssetDescription() {
        let expectedSource = Fixture.generated(project: .example, name: "ImageAsset")
        
        let source = SwiftSource()
            .appendImageAssets(images: blackboardImages)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
    func testUIImageDescription() {
        let expectedSource = Fixture.generated(project: .example, name: "UIImage")
        
        let source = SwiftSource()
            .appendUIImages(images: blackboardImages)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
}
