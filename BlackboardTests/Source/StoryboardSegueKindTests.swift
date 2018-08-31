//
//  StoryboardSegueKindTests.swift
//  BlackboardTests
//
//  Created by Nathan E. Walczak on 8/31/18.
//  Copyright © 2018 Nathan E. Walczak. All rights reserved.
//

import XCTest

@testable import Blackboard

class StoryboardSegueKindTests: XCTestCase {
    
    func testRawValues() {
        XCTAssertEqual(StoryboardSegueKind.embed.rawValue, "embed")
        XCTAssertEqual(StoryboardSegueKind.popoverPresentation.rawValue, "popoverPresentation")
        XCTAssertEqual(StoryboardSegueKind.presentation.rawValue, "presentation")
        XCTAssertEqual(StoryboardSegueKind.relationship.rawValue, "relationship")
        XCTAssertEqual(StoryboardSegueKind.show.rawValue, "show")
        XCTAssertEqual(StoryboardSegueKind.unwind.rawValue, "unwind")
    }
    
}
