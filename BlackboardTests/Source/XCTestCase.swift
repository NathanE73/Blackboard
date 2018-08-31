//
//  XCTestCase.swift
//  BlackboardTests
//
//  Created by Nathan E. Walczak on 8/31/18.
//  Copyright © 2018 Nathan E. Walczak. All rights reserved.
//

import XCTest

// MARK: - XMLDocument -

extension XCTestCase {
    
    func document(of xmlString: String, file: StaticString = #file, line: UInt = #line) -> XMLDocument? {
        do {
            let document = try XMLDocument(xmlString: xmlString, options: [])
            return document
        } catch {
            XCTFail("Unable to parse XML document.", file: file, line: line)
            return nil
        }
    }
    
    func rootElement(of xmlString: String, file: StaticString = #file, line: UInt = #line) -> XMLElement? {
        let document = self.document(of: xmlString, file: file, line: line)
        
        guard let rootElement = document?.rootElement() else {
            XCTFail("Missing root element from XML document.", file: file, line: line)
            return nil
        }
        return rootElement
    }
    
}
