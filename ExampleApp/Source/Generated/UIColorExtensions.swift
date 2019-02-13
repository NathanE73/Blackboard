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
    static let absoluteZero = color(named: "Absolute Zero", red: 0.0, green: 0.282, blue: 0.729, alpha: 1.0)
    
    // #FFE4C4 rgb(255, 228, 196)
    static let bisque = color(named: "Bisque", red: 1.0, green: 0.894, blue: 0.769, alpha: 1.0)
    
    // #36454F rgb(54, 69, 79)
    static let charcoal = color(named: "Charcoal", red: 0.212, green: 0.271, blue: 0.31, alpha: 1.0)
    
    // #556B2F rgb(85, 107, 47)
    static let darkOliveGreen = color(named: "dark-olive-green", red: 0.333, green: 0.42, blue: 0.184, alpha: 1.0)
    
    // #EA3C53 rgb(234, 60, 83)
    static let desire = color(named: "Desire", red: 0.917647058823529, green: 0.235294117647059, blue: 0.325490196078431, alpha: 1.0)
    
    // #50C878 rgb(80, 200, 120)
    static let emerald = color(named: "Emerald", red: 0.313725490196078, green: 0.784313725490196, blue: 0.470588235294118, alpha: 1.0)
    
    // #B22222 rgb(178, 34, 34)
    static let firebrick = color(named: "firebrick-color", red: 0.698, green: 0.133, blue: 0.133, alpha: 1.0)
    
    // #800000 rgb(128, 0, 0)
    static let maroon = color(named: "maroon color", red: 0.502, green: 0.0, blue: 0.0, alpha: 1.0)
    
    // #0D0D0D rgba(13, 13, 13, 0.475)
    static let night = color(named: "Night", red: 0.05, green: 0.05, blue: 0.05, alpha: 0.475)
    
}
