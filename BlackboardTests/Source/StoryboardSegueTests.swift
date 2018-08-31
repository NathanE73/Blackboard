//
//  StoryboardSegueTests.swift
//  BlackboardTests
//
//  Created by Nathan E. Walczak on 8/31/18.
//  Copyright © 2018 Nathan E. Walczak. All rights reserved.
//

import XCTest

@testable import Blackboard

class StoryboardSegueTests: XCTestCase {
    
    // MARK: - Description -
    
    func testDescription() {
        // Given
        let segue = StoryboardSegue(id: "007", kind: .embed, identifier: "ShowMovie", destination: "diamonds")
        
        // When
        let description = segue.description
        
        // Then
        XCTAssertEqual(description, "id: 007, kind: embed, identifier: ShowMovie, destination: diamonds")
    }
    
    func testDescriptionWithNilIdentifier() {
        // Given
        let segue = StoryboardSegue(id: "007", kind: .embed, identifier: nil, destination: "diamonds")
        
        // When
        let description = segue.description
        
        // Then
        XCTAssertEqual(description, "id: 007, kind: embed, identifier: nil, destination: diamonds")
    }
    
    // MARK: - Init With Node -
    
    func testInitWithNode() {
        // Given
        let xml = """
        <segue destination="VfR-kH-ZWE" kind="show" identifier="ShowMenu" id="fqf-70-rqe"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let segue = StoryboardSegue(node: element)
        
        // Then
        XCTAssertNotNil(segue)
        XCTAssertEqual(segue?.id, "fqf-70-rqe")
        XCTAssertEqual(segue?.kind, .show)
        XCTAssertEqual(segue?.identifier, "ShowMenu")
        XCTAssertEqual(segue?.destination, "VfR-kH-ZWE")
    }
    
    func testInitWithNodeWithoutIdentifier() {
        // Given
        let xml = """
        <segue destination="VfR-kH-ZWE" kind="show" id="fqf-70-rqe"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let segue = StoryboardSegue(node: element)
        
        // Then
        XCTAssertNotNil(segue)
        XCTAssertEqual(segue?.id, "fqf-70-rqe")
        XCTAssertEqual(segue?.kind, .show)
        XCTAssertNil(segue?.identifier)
        XCTAssertEqual(segue?.destination, "VfR-kH-ZWE")
    }
    
    func testInitWithNodeHavingInvalidElementName() {
        // Given
        let xml = """
        <invalid destination="VfR-kH-ZWE" kind="show" identifier="ShowMenu" id="fqf-70-rqe"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let segue = StoryboardSegue(node: element)
        
        // Then
        XCTAssertNil(segue)
    }
    
    func testInitWithNodeMissingIdAttribute() {
        // Given
        let xml = """
        <segue destination="VfR-kH-ZWE" kind="show" identifier="ShowMenu"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let segue = StoryboardSegue(node: element)
        
        // Then
        XCTAssertNil(segue)
    }
    
    func testInitWithNodeMissingKindAttribute() {
        // Given
        let xml = """
        <segue destination="VfR-kH-ZWE" identifier="ShowMenu" id="fqf-70-rqe"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let segue = StoryboardSegue(node: element)
        
        // Then
        XCTAssertNil(segue)
    }
    
    func testInitWithNodeMissingDestinationAttribute() {
        // Given
        let xml = """
        <segue kind="show" identifier="ShowMenu" id="fqf-70-rqe"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let segue = StoryboardSegue(node: element)
        
        // Then
        XCTAssertNil(segue)
    }
    
}
