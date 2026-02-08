//
// Copyright (c) 2022 Nathan E. Walczak
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

@testable import BlackboardFramework
import XCTest

class AssetGroupTests: XCTestCase {
    func testDecodable() {
        let json = """
          {
            "info" : {
            "version" : 1,
            "author" : "xcode"
          },
          "properties" : {
            "on-demand-resource-tags" : [
              "one",
              "two"
            ],
            "provides-namespace" : true
          }
        }
        """
        let data = Data(json.utf8)

        do {
            let group = try JSONDecoder().decode(AssetGroup.self, from: data)

            XCTAssertEqual(group.info.version, 1)
            XCTAssertEqual(group.info.author, "xcode")

            XCTAssertEqual(group.properties?.onDemandResourceTags, ["one", "two"])
            XCTAssertEqual(group.properties?.providesNamespace, true)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testOnlyInfoDecodable() {
        let json = """
          {
            "info" : {
            "version" : 1,
            "author" : "xcode"
          }
        }
        """
        let data = Data(json.utf8)

        do {
            let group = try JSONDecoder().decode(AssetGroup.self, from: data)

            XCTAssertEqual(group.info.version, 1)
            XCTAssertEqual(group.info.author, "xcode")

            XCTAssertNil(group.properties)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testEmptyPropertiesDecodable() {
        let json = """
          {
            "info" : {
            "version" : 1,
            "author" : "xcode"
          },
          "properties" : {
          }
        }
        """
        let data = Data(json.utf8)

        do {
            let group = try JSONDecoder().decode(AssetGroup.self, from: data)

            XCTAssertEqual(group.info.version, 1)
            XCTAssertEqual(group.info.author, "xcode")

            XCTAssertNotNil(group.properties)
            XCTAssertNil(group.properties?.onDemandResourceTags)
            XCTAssertNil(group.properties?.providesNamespace)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testOnlyOnDemandResourceTagsDecodable() {
        let json = """
          {
            "info" : {
            "version" : 1,
            "author" : "xcode"
          },
          "properties" : {
            "on-demand-resource-tags" : [
              "one",
              "two"
            ]
          }
        }
        """
        let data = Data(json.utf8)

        do {
            let group = try JSONDecoder().decode(AssetGroup.self, from: data)

            XCTAssertEqual(group.info.version, 1)
            XCTAssertEqual(group.info.author, "xcode")

            XCTAssertEqual(group.properties?.onDemandResourceTags, ["one", "two"])
            XCTAssertNil(group.properties?.providesNamespace)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testOnlyProvidesNamespaceDecodable() {
        let json = """
          {
            "info" : {
            "version" : 1,
            "author" : "xcode"
          },
          "properties" : {
            "provides-namespace" : false
          }
        }
        """
        let data = Data(json.utf8)

        do {
            let group = try JSONDecoder().decode(AssetGroup.self, from: data)

            XCTAssertEqual(group.info.version, 1)
            XCTAssertEqual(group.info.author, "xcode")

            XCTAssertNil(group.properties?.onDemandResourceTags)
            XCTAssertEqual(group.properties?.providesNamespace, false)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
