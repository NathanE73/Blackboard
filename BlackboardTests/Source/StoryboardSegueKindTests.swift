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
        // Given
        let Kind = StoryboardSegue.Kind.self
        
        // Then
        XCTAssertEqual(Kind.embed.rawValue, "embed")
        XCTAssertEqual(Kind.popoverPresentation.rawValue, "popoverPresentation")
        XCTAssertEqual(Kind.presentation.rawValue, "presentation")
        XCTAssertEqual(Kind.relationship.rawValue, "relationship")
        XCTAssertEqual(Kind.show.rawValue, "show")
        XCTAssertEqual(Kind.unwind.rawValue, "unwind")
    }
    
}
