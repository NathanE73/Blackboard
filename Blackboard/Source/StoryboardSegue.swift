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

enum StoryboardSegueKind: String {
    
    case Embed = "embed"
    case Presentation = "presentation"
    case Relationship = "relationship"
    case Show = "show"
    case Unwind = "unwind"
    
}

struct StoryboardSegue {
    
    let id: String
    
    let kind: StoryboardSegueKind
    let identifier: String?
    let destination: String
    
}

extension StoryboardSegue: CustomStringConvertible {
    
    var description: String {
        return "id: \(id), kind: \(kind), identifier: \(identifier ?? "nil"), destination: \(destination)"
    }
    
}

extension StoryboardSegue {
    
    init?(node: NSXMLNode) {
        guard let element = node as? NSXMLElement where element.name == "segue" else {
            return nil
        }
        
        guard let id = element.attributeForName("id")?.stringValue else {
            return nil
        }
        self.id = id
        
        guard let kindAttribute = element.attributeForName("kind")?.stringValue,
            kind = StoryboardSegueKind(rawValue: kindAttribute) else {
                return nil
        }
        self.kind = kind
        
        identifier = element.attributeForName("identifier")?.stringValue
        
        guard let destination = element.attributeForName("destination")?.stringValue else {
            return nil
        }
        self.destination = destination
    }
    
}
