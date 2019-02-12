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

let BlackboardColorSwiftSourceTestData = """
//
//  UIColorExtensions.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

fileprivate func color(named: String, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    if #available(iOS 11.0, *) {
        if let color = UIColor(named: named) {
            return color
        }
    }
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
}

extension UIColor {
    
    // #0048BA rgb(0, 72, 186)
    static let absoluteZero = color(named: "Absolute Zero", red: 0.0, green: 0.282352941176471, blue: 0.729411764705882, alpha: 1.0)
    
    // #FFE4C4 rgb(255, 228, 196)
    static let bisque = color(named: "Bisque", red: 1.0, green: 0.894117647058823, blue: 0.768627450980392, alpha: 1.0)
    
    // #36454F rgb(54, 69, 79)
    static let charcoal = color(named: "Charcoal", red: 0.211764705882353, green: 0.270588235294118, blue: 0.309803921568628, alpha: 1.0)
    
    // #EA3C53 rgb(234, 60, 83)
    static let desire = color(named: "Desire", red: 0.917647058823529, green: 0.235294117647059, blue: 0.325490196078431, alpha: 1.0)
    
    // #50C878 rgb(80, 200, 120)
    static let emerald = color(named: "Emerald", red: 0.313725490196078, green: 0.784313725490196, blue: 0.470588235294118, alpha: 1.0)
    
    // #0D0D0D rgba(13, 13, 13, 0.475)
    static let night = color(named: "Night", red: 0.05, green: 0.05, blue: 0.05, alpha: 0.475)
    
}

"""
