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
