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
    
    let factory = ImageSetFactory()
    
    func testDescription() {
        let expectedSource = BlackboardUIImageSwiftSource
        
        let imageSets: [ImageSet?] = [
            factory.asset(name: "apple", data: AppleImageSetTestData),
            factory.asset(name: "apple television", data: AppleTelevisionImageSetTestData), // should be ignored
            factory.asset(name: "button", data: ButtonImageSetTestData),
            factory.asset(name: "big_apple", data: BigAppleImageSetTestData),
            factory.asset(name: "everything--apple", data: EverythingAppleImageSetTestData),
            factory.asset(name: "green-paper-clip", data: GreenPaperClipImageSetTestData),
            factory.asset(name: "green-pencil", data: GreenPencilImageSetTestData),
            factory.asset(name: "large-apple", data: LargeAppleImageSetTestData),
            factory.asset(name: "red-cup", data: RedCupImageSetTestData),
            factory.asset(name: "red-stapler", data: RedStaplerImageSetTestData),
            factory.asset(name: "RedApple", data: RedAppleImageSetTestData),
            factory.asset(name: "silver-paper-clip", data: SilverPaperClipImageSetTestData),
            factory.asset(name: "small apple", data: SmallAppleImageSetTestData),
            factory.asset(name: "white-dice", data: WhiteDiceImageSetTestData)
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
