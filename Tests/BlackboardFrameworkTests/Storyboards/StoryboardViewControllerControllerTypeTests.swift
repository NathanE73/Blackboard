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

class StoryboardViewControllerControllerTypeTests: XCTestCase {
    
    func testAllCases() {
        // Given
        let Type = StoryboardViewController.ControllerType.self
        
        // When
        let allCases = Type.allCases
        
        // Then
        XCTAssertEqual(allCases, [.collectionViewController, .navigationController, .pageViewController,
                                  .splitViewController, .tabBarController, .tableViewController,
                                  .viewController, .viewControllerPlaceholder])
    }
    
    func testRawValues() {
        // Given
        let Type = StoryboardViewController.ControllerType.self
        
        // Then
        XCTAssertEqual(Type.collectionViewController.rawValue, "collectionViewController")
        XCTAssertEqual(Type.navigationController.rawValue, "navigationController")
        XCTAssertEqual(Type.pageViewController.rawValue, "pageViewController")
        XCTAssertEqual(Type.splitViewController.rawValue, "splitViewController")
        XCTAssertEqual(Type.tabBarController.rawValue, "tabBarController")
        XCTAssertEqual(Type.tableViewController.rawValue, "tableViewController")
        XCTAssertEqual(Type.viewController.rawValue, "viewController")
        XCTAssertEqual(Type.viewControllerPlaceholder.rawValue, "viewControllerPlaceholder")
    }
    
    func testClassName() {
        // Given
        let Type = StoryboardViewController.ControllerType.self
        
        // Then
        XCTAssertEqual(Type.collectionViewController.className, "UICollectionViewController")
        XCTAssertEqual(Type.navigationController.className, "UINavigationController")
        XCTAssertEqual(Type.pageViewController.className, "UIPageViewController")
        XCTAssertEqual(Type.splitViewController.className, "UISplitViewController")
        XCTAssertEqual(Type.tabBarController.className, "UITabBarController")
        XCTAssertEqual(Type.tableViewController.className, "UITableViewController")
        XCTAssertEqual(Type.viewController.className, "UIViewController")
        XCTAssertNil(Type.viewControllerPlaceholder.className)
    }
    
}
