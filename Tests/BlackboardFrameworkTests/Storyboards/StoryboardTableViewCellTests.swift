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

@testable import BlackboardFramework

class StoryboardTableViewCellTests: XCTestCase {
    
    // MARK: - Description
    
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
    
    // MARK: - Init With Node
    
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
