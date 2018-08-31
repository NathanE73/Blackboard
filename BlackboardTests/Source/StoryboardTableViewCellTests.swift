//
//  StoryboardTableViewCellTests.swift
//  BlackboardTests
//
//  Created by Nathan E. Walczak on 8/31/18.
//  Copyright © 2018 Nathan E. Walczak. All rights reserved.
//

import Foundation

import XCTest

@testable import Blackboard

class StoryboardTableViewCellTests: XCTestCase {
    
    // MARK: - Description -
    
    func testDescription() {
        // Given
        let cell = StoryboardTableViewCell(id: "007", reuseIdentifier: "ShowMovie", customClass: "CustomCell")
        
        // When
        let description = cell.description
        
        // Then
        XCTAssertEqual(description, "id: 007, reuseIdentifier: ShowMovie, customClass: CustomCell")
    }
    
    func testDescriptionWithNilReuseIdentifier() {
        // Given
        let cell = StoryboardTableViewCell(id: "007", reuseIdentifier: nil, customClass: "CustomCell")
        
        // When
        let description = cell.description
        
        // Then
        XCTAssertEqual(description, "id: 007, reuseIdentifier: nil, customClass: CustomCell")
    }
    
    func testDescriptionWithNilCustomClass() {
        // Given
        let cell = StoryboardTableViewCell(id: "007", reuseIdentifier: "ShowMovie", customClass: nil)
        
        // When
        let description = cell.description
        
        // Then
        XCTAssertEqual(description, "id: 007, reuseIdentifier: ShowMovie, customClass: nil")
    }
    
    // MARK: - Init With Node -
    
    func testInitWithNode() {
        // Given
        let xml = """
        <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" selectionStyle="default" indentationWidth="10" reuseIdentifier="AccountName" textLabel="R0V-lg-9kr" style="IBUITableViewCellStyleDefault" id="ZAm-1C-OhX" customClass="AccountNameTableViewCell"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardTableViewCell(node: element)
        
        // Then
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.id, "ZAm-1C-OhX")
        XCTAssertEqual(cell?.reuseIdentifier, "AccountName")
        XCTAssertEqual(cell?.customClass, "AccountNameTableViewCell")
    }
    
    func testInitWithNodeWithoutReuseIdentifier() {
        // Given
        let xml = """
        <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" selectionStyle="default" indentationWidth="10" textLabel="R0V-lg-9kr" style="IBUITableViewCellStyleDefault" id="ZAm-1C-OhX" customClass="AccountNameTableViewCell"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardTableViewCell(node: element)
        
        // Then
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.id, "ZAm-1C-OhX")
        XCTAssertNil(cell?.reuseIdentifier)
        XCTAssertEqual(cell?.customClass, "AccountNameTableViewCell")
    }
    
    func testInitWithNodeWithoutCustomClass() {
        // Given
        let xml = """
        <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" selectionStyle="default" indentationWidth="10" reuseIdentifier="AccountName" textLabel="R0V-lg-9kr" style="IBUITableViewCellStyleDefault" id="ZAm-1C-OhX"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardTableViewCell(node: element)
        
        // Then
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.id, "ZAm-1C-OhX")
        XCTAssertEqual(cell?.reuseIdentifier, "AccountName")
        XCTAssertNil(cell?.customClass)
    }
    
    func testInitWithNodeHavingInvalidElementName() {
        // Given
        let xml = """
        <invalid clipsSubviews="YES" contentMode="scaleToFill" selectionStyle="default" indentationWidth="10" reuseIdentifier="AccountName" textLabel="R0V-lg-9kr" style="IBUITableViewCellStyleDefault" id="ZAm-1C-OhX" customClass="AccountNameTableViewCell"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardTableViewCell(node: element)
        
        // Then
        XCTAssertNil(cell)
    }
    
    func testInitWithNodeMissingIdAttribute() {
        // Given
        let xml = """
        <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" selectionStyle="default" indentationWidth="10" reuseIdentifier="AccountName" textLabel="R0V-lg-9kr" style="IBUITableViewCellStyleDefault" customClass="AccountNameTableViewCell"/>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let cell = StoryboardTableViewCell(node: element)
        
        // Then
        XCTAssertNil(cell)
    }
    
}
