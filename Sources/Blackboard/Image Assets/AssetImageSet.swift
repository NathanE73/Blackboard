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

struct AssetImageSet : Decodable {
    var info: Info
    var images: [Image]
}

extension AssetImageSet {
    
    struct Info : Decodable {
        var version: Int
        var author: String
    }
    
}

extension AssetImageSet {
    
    struct Image : Decodable {
        var idiom: Idiom
        var scale: Scale?
        
        enum CodingKeys: String, CodingKey {
            case idiom
            case scale
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            idiom = try container.decodeIfPresent(Idiom.self, forKey: .idiom) ?? .universal
            scale = try container.decodeIfPresent(Scale.self, forKey: .scale)
        }
    }
    
}

extension AssetImageSet.Image {
    
    enum Idiom: String, Decodable {
        case car
        case iphone
        case ipad
        case mac
        case tv
        case universal
        case watch
    }
    
}

extension AssetImageSet.Image {
    
    enum Scale: String, Decodable {
        case one = "1x"
        case two = "2x"
        case three = "3x"
    }
    
}
