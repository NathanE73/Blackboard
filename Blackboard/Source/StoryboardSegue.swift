//
// Copyright (c) 2016 Nathan E. Walczak
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

extension StoryboardSegue {
    
    enum Kind: String {
        
        case embed
        case popoverPresentation
        case presentation
        case relationship
        case show
        case unwind
        
    }
    
}

struct StoryboardSegue {
    
    let id: String
    
    let kind: Kind
    let identifier: String?
    let destination: String
    
}

extension StoryboardSegue: CustomStringConvertible {
    
    var description: String {
        return "id: \(id), kind: \(kind), identifier: \(identifier ?? "nil"), destination: \(destination)"
    }
    
}

extension StoryboardSegue {
    
    init?(node: XMLNode?) {
        guard let element = node as? XMLElement,
            element.name == "segue" else {
                return nil
        }
        
        guard let id = element.attribute(forName: "id")?.stringValue else {
            return nil
        }
        self.id = id
        
        guard let kindAttribute = element.attribute(forName: "kind")?.stringValue,
            let kind = Kind(rawValue: kindAttribute) else {
                return nil
        }
        self.kind = kind
        
        identifier = element.attribute(forName: "identifier")?.stringValue
        
        guard let destination = element.attribute(forName: "destination")?.stringValue else {
            return nil
        }
        self.destination = destination
    }
    
}
