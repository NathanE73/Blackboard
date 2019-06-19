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
    
    func testDescription() {
        let expectedSource = Fixture.generated(project: .example, name: "UIImage")
        
        let imageSets: [ImageSet?] = [
            Fixture.imageSet(project: .example, path: "Apples", name: "apple"),
            Fixture.imageSet(project: .example, path: "Apples", name: "apple television"), // should be ignored
            Fixture.imageSet(project: .example, path: "Photos", name: "button"),
            Fixture.imageSet(project: .example, path: "Apples", name: "big_apple"),
            Fixture.imageSet(project: .example, path: "Apples", name: "everything--apple"),
            Fixture.imageSet(project: .example, path: "Photos", name: "green-paper-clip"),
            Fixture.imageSet(project: .example, path: "Photos", name: "green-pencil"),
            Fixture.imageSet(project: .example, path: "Apples", name: "large-apple"),
            Fixture.imageSet(project: .example, path: "Photos", name: "Red/cup"),
            Fixture.imageSet(project: .example, path: "Photos", name: "Red/stapler"),
            Fixture.imageSet(project: .example, path: "Apples", name: "RedApple"),
            Fixture.imageSet(project: .example, path: "Photos", name: "silver-paper-clip"),
            Fixture.imageSet(project: .example, path: "Apples", name: "small apple"),
            Fixture.imageSet(project: .example, path: "Photos", name: "white-dice")
        ]
        
        let blackboardImages = imageSets
            .compactMap { $0 }
            .compactMap(BlackboardImage.init)
            .sorted { $0.functionName.localizedCaseInsensitiveCompare($1.functionName) == .orderedAscending }
        
        XCTAssertEqual(blackboardImages.count, 13)
        
        let swiftSource = SwiftSource()
        swiftSource.appendImages(images: blackboardImages)
        let source = swiftSource.description
        
        XCTAssertEqual(source, expectedSource)
    }
    
}
