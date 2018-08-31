//
//  StoryboardCollectionViewCellTests.swift
//  BlackboardTests
//
//  Created by Nathan E. Walczak on 8/31/18.
//  Copyright © 2018 Nathan E. Walczak. All rights reserved.
//

import Foundation

import XCTest

@testable import Blackboard

class StoryboardCollectionViewCellTests: XCTestCase {
    
    // MARK: - Description -
    
    func testDescription() {
        // Given
        let cell = StoryboardCollectionViewCell(id: "007", reuseIdentifier: "ShowMovie", customClass: "CustomCell")
        
        // When
        let description = cell.description
        
        // Then
        XCTAssertEqual(description, "id: 007, reuseIdentifier: ShowMovie, customClass: CustomCell")
    }
    
    func testDescriptionWithNilReuseIdentifier() {
        // Given
        let cell = StoryboardCollectionViewCell(id: "007", reuseIdentifier: nil, customClass: "CustomCell")
        
        // When
        let description = cell.description
        
        // Then
        XCTAssertEqual(description, "id: 007, reuseIdentifier: nil, customClass: CustomCell")
    }
    
    func testDescriptionWithNilCustomClass() {
        // Given
        let cell = StoryboardCollectionViewCell(id: "007", reuseIdentifier: "ShowMovie", customClass: nil)
        
        // When
        let description = cell.description
        
        // Then
        XCTAssertEqual(description, "id: 007, reuseIdentifier: ShowMovie, customClass: nil")
    }
    
    // MARK: - Init With Node -
    
    func testInitWithNode() {
        // Given
        let xml = """
        <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Red" id="cHC-Sw-7zu" customClass="RedCollectionViewCell"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardCollectionViewCell(node: element)
        
        // Then
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.id, "cHC-Sw-7zu")
        XCTAssertEqual(cell?.reuseIdentifier, "Red")
        XCTAssertEqual(cell?.customClass, "RedCollectionViewCell")
    }
    
    func testInitWithNodeWithoutReuseIdentifier() {
        // Given
        let xml = """
        <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" id="cHC-Sw-7zu" customClass="RedCollectionViewCell"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardCollectionViewCell(node: element)
        
        // Then
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.id, "cHC-Sw-7zu")
        XCTAssertNil(cell?.reuseIdentifier)
        XCTAssertEqual(cell?.customClass, "RedCollectionViewCell")
    }
    
    func testInitWithNodeWithoutCustomClass() {
        // Given
        let xml = """
        <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Red" id="cHC-Sw-7zu"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardCollectionViewCell(node: element)
        
        // Then
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.id, "cHC-Sw-7zu")
        XCTAssertEqual(cell?.reuseIdentifier, "Red")
        XCTAssertNil(cell?.customClass)
    }
    
    func testInitWithNodeHavingInvalidElementName() {
        // Given
        let xml = """
        <invalid opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Red" id="cHC-Sw-7zu" customClass="RedCollectionViewCell"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardCollectionViewCell(node: element)
        
        // Then
        XCTAssertNil(cell)
    }
    
    func testInitWithNodeMissingIdAttribute() {
        // Given
        let xml = """
        <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Red" customClass="RedCollectionViewCell"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardCollectionViewCell(node: element)
        
        // Then
        XCTAssertNil(cell)
    }
    
}
