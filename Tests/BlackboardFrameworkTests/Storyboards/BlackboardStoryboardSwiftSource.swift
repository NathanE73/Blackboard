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

class BlackboardStoryboardSwiftSource: XCTestCase {
    
    var accountStoryboard: Storyboard?
    var mainStoryboard: Storyboard?
    var photoStoryboard: Storyboard?
    
    var storyboards: [Storyboard] = []
    
    override func setUp() {
        accountStoryboard = Fixture.storyboard(project: .example, name: "Account")
        mainStoryboard = Fixture.storyboard(project: .example, name: "Main")
        photoStoryboard = Fixture.storyboard(project: .example, name: "Photo")
        
        storyboards = [
            accountStoryboard,
            mainStoryboard,
            photoStoryboard
            ].compactMap { $0 }
    }
    
    func testAccountStoryboard() {
        let expectedSource = Fixture.generated(project: .example, name: "AccountStoryboard")
        
        guard let accountStoryboard = accountStoryboard,
            let storyboard = BlackboardStoryboard(accountStoryboard, storyboards: storyboards) else {
                XCTFail("Unable to decode storyboard data")
                return
        }
        
        let source = SwiftSource()
            .appendStoryboard(storyboard)
            .source
        
        XCTAssertEqual(source, expectedSource)
    }
    
    func testMainStoryboard() {
        let expectedSource = Fixture.generated(project: .example, name: "MainStoryboard")
        
        guard let mainStoryboard = mainStoryboard,
            let storyboard = BlackboardStoryboard(mainStoryboard, storyboards: storyboards) else {
                XCTFail("Unable to decode storyboard data")
                return
        }
        
        let source = SwiftSource()
            .appendStoryboard(storyboard)
            .source
        
        XCTAssertEqual(source, expectedSource)
    }
    
    func testPhotoStoryboard() {
        let expectedSource = Fixture.generated(project: .example, name: "PhotoStoryboard")
        
        guard let photoStoryboard = photoStoryboard,
            let storyboard = BlackboardStoryboard(photoStoryboard, storyboards: storyboards) else {
                XCTFail("Unable to decode storyboard data")
                return
        }
        
        let source = SwiftSource()
            .appendStoryboard(storyboard)
            .source
        
        XCTAssertEqual(source, expectedSource)
    }
    
}
