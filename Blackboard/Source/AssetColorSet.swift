//
// Copyright (c) 2017 Nathan E. Walczak
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
    let info: Info
    let colors: [Color]
}

extension AssetColorSet {
    
    struct Info : Decodable {
        let version: Int
        let author: String
    }
    
    struct Color : Decodable {
        let idiom: Idiom
        let color: Color
    }
    
}

extension AssetColorSet.Color {
    
    enum Idiom: String, Decodable {
        case appLauncher
        case companionSettings
        case iosMarketing = "ios-marketing"
        case iphone
        case ipad
        case mac
        case notificationCenter
        case quickLook
        case tv
        case universal
        case watch
        case watchMarketing = "watch-marketing"
    }
    
}

extension AssetColorSet.Color {
    
    struct Color : Decodable {
        let colorSpace: String
        let components: Components
        
        private enum CodingKeys : String, CodingKey {
            case colorSpace = "color-space"
            case components
        }
    }
    
}

extension AssetColorSet.Color.Color {
    
    struct Components : Decodable {
        let red: Double
        let green: Double
        let blue: Double
        let alpha: Double
    }
    
}
