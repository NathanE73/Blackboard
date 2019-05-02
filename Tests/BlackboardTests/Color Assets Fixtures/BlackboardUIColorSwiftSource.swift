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

import Foundation

let BlackboardUIColorSwiftSource = """
//
//  UIColor.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

fileprivate func color(identifier: ColorAssetName, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    if #available(iOS 11.0, *) {
        if let color = UIColor(named: identifier.rawValue) {
            return color
        }
    }
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
}

enum ColorAssetName: String {
    
    case absoluteZero = "Absolute Zero"
    case bisque = "Bisque"
    case black = "black"
    case blue = "blue"
    case brown = "brown"
    case charcoal = "Charcoal"
    case clear = "clear"
    case cyan = "cyan"
    case darkGray = "darkGray"
    case darkOliveGreen = "dark-olive-green"
    case desire = "Desire"
    case emerald = "Emerald"
    case firebrick = "firebrick-color"
    case fluorescentBlizzardBlue = "Fluorescent/Blizzard Blue"
    case fluorescentMagicMint = "Fluorescent/Magic Mint"
    case fluorescentRadicalRed = "Fluorescent/Radical Red"
    case gray = "gray"
    case green = "green"
    case lightGray = "lightGray"
    case magenta = "magenta"
    case maroon = "maroon color"
    case night = "Night"
    case orange = "orange"
    case purple = "purple"
    case red = "red"
    case white = "white"
    case yellow = "yellow"
    
    var color: UIColor {
        switch self {
        case .absoluteZero:
            return .absoluteZero
        case .bisque:
            return .bisque
        case .black:
            return .black
        case .blue:
            return .blue
        case .brown:
            return .brown
        case .charcoal:
            return .charcoal
        case .clear:
            return .clear
        case .cyan:
            return .cyan
        case .darkGray:
            return .darkGray
        case .darkOliveGreen:
            return .darkOliveGreen
        case .desire:
            return .desire
        case .emerald:
            return .emerald
        case .firebrick:
            return .firebrick
        case .fluorescentBlizzardBlue:
            return .fluorescentBlizzardBlue
        case .fluorescentMagicMint:
            return .fluorescentMagicMint
        case .fluorescentRadicalRed:
            return .fluorescentRadicalRed
        case .gray:
            return .gray
        case .green:
            return .green
        case .lightGray:
            return .lightGray
        case .magenta:
            return .magenta
        case .maroon:
            return .maroon
        case .night:
            return .night
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .red:
            return .red
        case .white:
            return .white
        case .yellow:
            return .yellow
        }
    }
    
}

extension UIColor {
    
    // #0048BA rgb(0, 72, 186)
    static let absoluteZero = color(identifier: .absoluteZero, red: 0.0, green: 0.282, blue: 0.729, alpha: 1.0)
    
    // #FFE4C4 rgb(255, 228, 196)
    static let bisque = color(identifier: .bisque, red: 1.0, green: 0.894, blue: 0.769, alpha: 1.0)
    
    // #36454F rgb(54, 69, 79)
    static let charcoal = color(identifier: .charcoal, red: 0.212, green: 0.271, blue: 0.31, alpha: 1.0)
    
    // #556B2F rgb(85, 107, 47)
    static let darkOliveGreen = color(identifier: .darkOliveGreen, red: 0.333, green: 0.42, blue: 0.184, alpha: 1.0)
    
    // #EA3C53 rgb(234, 60, 83)
    static let desire = color(identifier: .desire, red: 0.918, green: 0.235, blue: 0.325, alpha: 1.0)
    
    // #50C878 rgb(80, 200, 120)
    static let emerald = color(identifier: .emerald, red: 0.314, green: 0.784, blue: 0.471, alpha: 1.0)
    
    // #B22222 rgb(178, 34, 34)
    static let firebrick = color(identifier: .firebrick, red: 0.698, green: 0.133, blue: 0.133, alpha: 1.0)
    
    // #50BFE6 rgb(80, 191, 230)
    static let fluorescentBlizzardBlue = color(identifier: .fluorescentBlizzardBlue, red: 0.314, green: 0.749, blue: 0.902, alpha: 1.0)
    
    // #AAF0D1 rgb(170, 240, 209)
    static let fluorescentMagicMint = color(identifier: .fluorescentMagicMint, red: 0.667, green: 0.941, blue: 0.82, alpha: 1.0)
    
    // #FF355E rgb(255, 53, 94)
    static let fluorescentRadicalRed = color(identifier: .fluorescentRadicalRed, red: 1.0, green: 0.208, blue: 0.369, alpha: 1.0)
    
    // #800000 rgb(128, 0, 0)
    static let maroon = color(identifier: .maroon, red: 0.502, green: 0.0, blue: 0.0, alpha: 1.0)
    
    // #0D0D0D rgba(13, 13, 13, 0.475)
    static let night = color(identifier: .night, red: 0.05, green: 0.05, blue: 0.05, alpha: 0.475)
    
}

"""
