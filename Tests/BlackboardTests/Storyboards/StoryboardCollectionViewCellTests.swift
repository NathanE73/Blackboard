//
// Copyright (c) 2018 Nathan E. Walczak
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
