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

struct AssetColorSet : Decodable {
    var info: AssetInfo
    var colors: [Color]
}

extension AssetColorSet {
    
    struct Color : Decodable {
        var displayGamut: DisplayGamut
        var idiom: Idiom
        var color: Color
        
        enum CodingKeys: String, CodingKey {
            case displayGamut = "display-gamut"
            case idiom
            case color
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            displayGamut = try container.decodeIfPresent(DisplayGamut.self, forKey: .displayGamut) ?? .srgb
            idiom = try container.decodeIfPresent(Idiom.self, forKey: .idiom) ?? .universal
            color = try container.decode(Color.self, forKey: .color)
        }
    }
    
}

extension AssetColorSet.Color {
    
    enum DisplayGamut: String, Decodable {
        case srgb = "sRGB"
        case displayP3 = "display-P3"
    }
    
}

extension AssetColorSet.Color {
    
    enum Idiom: String, Decodable {
        case iphone
        case ipad
        case mac
        case tv
        case universal
        case watch
    }
    
}

extension AssetColorSet.Color {
    
    struct Color : Decodable {
        var colorSpace: ColorSpace
        var components: Components
        
        enum CodingKeys : String, CodingKey {
            case colorSpace = "color-space"
            case components
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            colorSpace = try container.decodeIfPresent(ColorSpace.self, forKey: .colorSpace) ?? .srgb
            components = try container.decode(Components.self, forKey: .components)
        }
    }
    
}

extension AssetColorSet.Color.Color {
    
    enum ColorSpace: String, Decodable {
        case srgb
        case displayP3 = "display-p3"
    }
    
}

extension AssetColorSet.Color.Color {
    
    struct Components : Decodable {
        var red: Double
        var green: Double
        var blue: Double
        var alpha: Double
        
        enum CodingKeys : String, CodingKey {
            case red
            case green
            case blue
            case alpha
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            let decode: (CodingKeys) throws -> Double = { key in
                if let string = try? container.decode(String.self, forKey: key) {
                    if string.lowercased().starts(with: "0x") {
                        if let color = Int(string.dropFirst(2), radix: 16) {
                            return Double(color) / 255
                        }
                    }
                    else if let color = Int(string) {
                        return Double(color) / 255
                    }
                    else if let color = Double(string) {
                        return color
                    }
                }
                return try container.decode(Double.self, forKey: key)
            }
            
            red = try decode(.red)
            green = try decode(.green)
            blue = try decode(.blue)
            alpha = try decode(.alpha)
        }
    }
    
}
