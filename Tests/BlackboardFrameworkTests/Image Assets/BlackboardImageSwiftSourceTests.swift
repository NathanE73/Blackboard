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

class BlackboardImageSwiftSourceTests: XCTestCase {
    
    var blackboardImages: [BlackboardImage] {
        let imageSets: [ImageSet?] = [
            Fixture.imageSet(project: .shared, name: "button"),
            Fixture.imageSet(project: .shared, path: "Paper Clips", name: "green-paper-clip"),
            Fixture.imageSet(project: .shared, name: "green-pencil"),
            Fixture.imageSet(project: .shared, name: "Red/cup"),
            Fixture.imageSet(project: .shared, name: "Red/stapler"),
            Fixture.imageSet(project: .shared, path: "Paper Clips", name: "silver-paper-clip"),
            Fixture.imageSet(project: .shared, name: "white-dice")
        ]
        
        var blackboardImages = imageSets
            .compactMap { $0 }
            .compactMap(BlackboardImage.init)
        
        blackboardImages.sort { $0.propertyName.localizedCaseInsensitiveCompare($1.propertyName) == .orderedAscending }
        
        return blackboardImages
    }
    
    func testNumberOfImages() {
        XCTAssertEqual(blackboardImages.count, 7)
    }
    
    func testImageAssetSource() {
        let expectedSource = Fixture.generated(project: .example, name: "ImageAsset")
        
        let source = SwiftSource()
            .appendImageAssets(images: blackboardImages)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
    func testImageSource() {
        let expectedSource = Fixture.generated(project: .example, name: "Image")
        
        let source = SwiftSource()
            .appendImages(images: blackboardImages,
                          target: Version(13, 0),
                          sdk: Version(14, 0))
            .source
        
        XCTAssertEqual(source, expectedSource)
    }
    
    func testUIImageSource() {
        let expectedSource = Fixture.generated(project: .example, name: "UIImage")
        
        let source = SwiftSource()
            .appendUIImages(images: blackboardImages)
            .source

        XCTAssertEqual(source, expectedSource)
    }
    
}
