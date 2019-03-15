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

class StoryboardViewControllerTests: XCTestCase {
    
    let xml = """
    <scene sceneID="AE9-hz-x1y">
      <objects>
        <viewController storyboardName="OtherStoryboard" storyboardIdentifier="CustomStoryboardIdentifier" id="NOn-MJ-fAW" customClass="CustomClass" sceneMemberID="viewController">
          <connections>
            <segue destination="destination-0" kind="show" identifier="identifier-0" id="id-0"/>
            <segue destination="destination-1" kind="relationship" identifier="identifier-1" id="id-1"/>
            <segue destination="destination-2" kind="show" identifier="identifier-2" id="id-2"/>
            <segue destination="destination-3" kind="show" identifier="identifier-3" id="id-3"/>
          </connections>
          <prototypes>
            <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" selectionStyle="default" indentationWidth="10" reuseIdentifier="reuseIdentifier-0" textLabel="R0V-lg-9kr" style="IBUITableViewCellStyleDefault" id="id-0" customClass="customClass-0"/>
            <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" selectionStyle="default" indentationWidth="10" reuseIdentifier="reuseIdentifier-1" textLabel="R0V-lg-9kr" style="IBUITableViewCellStyleDefault" id="id-1" customClass="customClass-1"/>
            <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" selectionStyle="default" indentationWidth="10" reuseIdentifier="reuseIdentifier-2" textLabel="R0V-lg-9kr" style="IBUITableViewCellStyleDefault" id="id-2" customClass="customClass-2"/>
          </prototypes>
          <cells>
            <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Red" id="id-0" customClass="customClass-0"/>
            <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Red" id="id-1" customClass="customClass-1"/>
          </cells>
        </viewController>
      </objects>
    </scene>
    """
    
    // MARK: - Description -
    
    func testDescription() {
        // Given
        let controller = StoryboardViewController(id: "007", type: .tableViewController,
                                                  storyboardIdentifier: "CustomIdentifer", referencedIdentifier: nil,
                                                  customClass: "CustomClass", storyboardName: "MainStoryboard",
                                                  segues: [], tableViewCells: [], collectionViewCells: [])
        
        // When
        let description = controller.description
        
        // Then
        XCTAssertEqual(description, "id: 007, type: tableViewController, storyboardIdentifier: CustomIdentifer, customClass: CustomClass, storyboardName: MainStoryboard")
    }
    
    func testDescriptionWithNilStoryboardIdentifier() {
        // Given
        let controller = StoryboardViewController(id: "007", type: .tableViewController,
                                                  storyboardIdentifier: nil, referencedIdentifier: nil,
                                                  customClass: "CustomClass", storyboardName: "MainStoryboard",
                                                  segues: [], tableViewCells: [], collectionViewCells: [])
        
        // When
        let description = controller.description
        
        // Then
        XCTAssertEqual(description, "id: 007, type: tableViewController, storyboardIdentifier: nil, customClass: CustomClass, storyboardName: MainStoryboard")
    }
    
    func testDescriptionWithNilCustomClass() {
        // Given
        let controller = StoryboardViewController(id: "007", type: .tableViewController,
                                                  storyboardIdentifier: "CustomIdentifer", referencedIdentifier: nil,
                                                  customClass: nil, storyboardName: "MainStoryboard",
                                                  segues: [], tableViewCells: [], collectionViewCells: [])
        
        // When
        let description = controller.description
        
        // Then
        XCTAssertEqual(description, "id: 007, type: tableViewController, storyboardIdentifier: CustomIdentifer, customClass: nil, storyboardName: MainStoryboard")
    }
    
    func testDescriptionWithNilStoryboardName() {
        // Given
        let controller = StoryboardViewController(id: "007", type: .tableViewController,
                                                  storyboardIdentifier: "CustomIdentifer", referencedIdentifier: nil,
                                                  customClass: "CustomClass", storyboardName: nil,
                                                  segues: [], tableViewCells: [], collectionViewCells: [])
        
        // When
        let description = controller.description
        
        // Then
        XCTAssertEqual(description, "id: 007, type: tableViewController, storyboardIdentifier: CustomIdentifer, customClass: CustomClass, storyboardName: nil")
    }
    
    // MARK: - Init With Node -
    
    func testInitWithNode() {
        // Given
        let element = rootElement(of: xml)
        
        // When
        let controller = StoryboardViewController(node: element)
        
        // Then
        XCTAssertNotNil(controller)
        XCTAssertEqual(controller?.id, "NOn-MJ-fAW")
        XCTAssertEqual(controller?.type, .viewController)
        XCTAssertEqual(controller?.storyboardIdentifier, "CustomStoryboardIdentifier")
        XCTAssertEqual(controller?.customClass, "CustomClass")
        XCTAssertEqual(controller?.storyboardName, "OtherStoryboard")
        XCTAssertEqual(controller?.segues.count, 4)
        XCTAssertEqual(controller?.tableViewCells.count, 3)
        XCTAssertEqual(controller?.collectionViewCells.count, 2)
    }
    
    func testInitWithNodeWithoutStoryboardIdentifier() {
        // Given
        let xml = """
        <scene>
          <viewController id="NOn-MJ-fAW" customClass="CustomClass" sceneMemberID="viewController"/>
        </scene>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let controller = StoryboardViewController(node: element)
        
        // Then
        XCTAssertNotNil(controller)
        XCTAssertEqual(controller?.id, "NOn-MJ-fAW")
        XCTAssertEqual(controller?.type, .viewController)
        XCTAssertNil(controller?.storyboardIdentifier)
        XCTAssertEqual(controller?.customClass, "CustomClass")
        XCTAssertNil(controller?.storyboardName)
        XCTAssertEqual(controller?.segues.count, 0)
        XCTAssertEqual(controller?.tableViewCells.count, 0)
        XCTAssertEqual(controller?.collectionViewCells.count, 0)
    }
    
    func testInitWithNodeWithoutCustomClass() {
        // Given
        let xml = """
        <scene>
          <viewController storyboardIdentifier="CustomStoryboardIdentifier" id="NOn-MJ-fAW" sceneMemberID="viewController"/>
        </scene>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let controller = StoryboardViewController(node: element)
        
        // Then
        XCTAssertNotNil(controller)
        XCTAssertEqual(controller?.id, "NOn-MJ-fAW")
        XCTAssertEqual(controller?.type, .viewController)
        XCTAssertEqual(controller?.storyboardIdentifier, "CustomStoryboardIdentifier")
        XCTAssertNil(controller?.customClass)
        XCTAssertNil(controller?.storyboardName)
        XCTAssertEqual(controller?.segues.count, 0)
        XCTAssertEqual(controller?.tableViewCells.count, 0)
        XCTAssertEqual(controller?.collectionViewCells.count, 0)
    }
    
    func testInitWithNodeWithoutStoryboardName() {
        // Given
        let xml = """
        <scene>
          <viewController storyboardIdentifier="CustomStoryboardIdentifier" id="NOn-MJ-fAW" customClass="CustomClass" sceneMemberID="viewController"/>
        </scene>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let controller = StoryboardViewController(node: element)
        
        // Then
        XCTAssertNotNil(controller)
        XCTAssertEqual(controller?.id, "NOn-MJ-fAW")
        XCTAssertEqual(controller?.type, .viewController)
        XCTAssertEqual(controller?.storyboardIdentifier, "CustomStoryboardIdentifier")
        XCTAssertEqual(controller?.customClass, "CustomClass")
        XCTAssertNil(controller?.storyboardName)
        XCTAssertEqual(controller?.segues.count, 0)
        XCTAssertEqual(controller?.tableViewCells.count, 0)
        XCTAssertEqual(controller?.collectionViewCells.count, 0)
    }
    
    func testInitWithNodeHavingInvalidElementName() {
        // Given
        let xml = """
        <scene>
          <invalid storyboardIdentifier="CustomStoryboardIdentifier" id="NOn-MJ-fAW" customClass="CustomClass" sceneMemberID="viewController"/>
        </scene>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let controller = StoryboardViewController(node: element)
        
        // Then
        XCTAssertNil(controller)
    }
    
    func testInitWithNodeMissingIdAttribute() {
        // Given
        let xml = """
        <scene>
          <viewController storyboardIdentifier="CustomStoryboardIdentifier" customClass="CustomClass" sceneMemberID="viewController"/>
        </scene>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let controller = StoryboardViewController(node: element)
        
        // Then
        XCTAssertNil(controller)
    }
    
    func testInitWithNodeMissingTypeAttribute() {
        // Given
        let xml = """
        <scene>
          <invalidController storyboardIdentifier="CustomStoryboardIdentifier" id="NOn-MJ-fAW" customClass="CustomClass" sceneMemberID="viewController"/>
        </scene>
        """
        
        let element = rootElement(of: xml)
        
        // When
        let controller = StoryboardViewController(node: element)
        
        // Then
        XCTAssertNil(controller)
    }
    
    // MARK: - Segue With -
    
    func testSegueWithId() {
        // Given
        let element = rootElement(of: xml)
        
        let controller = StoryboardViewController(node: element)
        
        // When
        let segue0 = controller?.segueWith(id: "id-0")
        let segue1 = controller?.segueWith(id: "id-1")
        
        let missingSegue = controller?.segueWith(id: "missing")
        
        // Then
        XCTAssertNotNil(segue0)
        XCTAssertEqual(segue0?.id, "id-0")
        
        XCTAssertNotNil(segue1)
        XCTAssertEqual(segue1?.id, "id-1")
        
        XCTAssertNil(missingSegue)
    }
    
    func testSegueWithKind() {
        // Given
        let element = rootElement(of: xml)
        
        let controller = StoryboardViewController(node: element)
        
        // When
        let relationshipSegue = controller?.segueWith(kind: .relationship)
        
        let missingSegue = controller?.segueWith(kind: .unwind)
        
        // Then
        XCTAssertNotNil(relationshipSegue)
        XCTAssertEqual(relationshipSegue?.id, "id-1")
        
        XCTAssertNil(missingSegue)
    }
    
    // MARK: - Table View Cell With -
    
    func testTableViewCellWithId() {
        // Given
        let element = rootElement(of: xml)
        
        let controller = StoryboardViewController(node: element)
        
        // When
        let cell0 = controller?.tableViewCellWith(id: "id-0")
        let cell1 = controller?.tableViewCellWith(id: "id-1")
        
        let missingCell = controller?.tableViewCellWith(id: "missing")
        
        // Then
        XCTAssertNotNil(cell0)
        XCTAssertEqual(cell0?.id, "id-0")
        
        XCTAssertNotNil(cell1)
        XCTAssertEqual(cell1?.id, "id-1")
        
        XCTAssertNil(missingCell)
    }
    
    // MARK: - Collection View Cell With -
    
    func testCollectionViewCellWithId() {
        // Given
        let element = rootElement(of: xml)
        
        let controller = StoryboardViewController(node: element)
        
        // When
        let cell0 = controller?.collectionViewCellWith(id: "id-0")
        let cell1 = controller?.collectionViewCellWith(id: "id-1")
        
        let missingCell = controller?.collectionViewCellWith(id: "missing")
        
        // Then
        XCTAssertNotNil(cell0)
        XCTAssertEqual(cell0?.id, "id-0")
        
        XCTAssertNotNil(cell1)
        XCTAssertEqual(cell1?.id, "id-1")
        
        XCTAssertNil(missingCell)
    }
    
}
