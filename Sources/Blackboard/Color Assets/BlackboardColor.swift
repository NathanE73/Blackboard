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

struct BlackboardColor {
    
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
    
    var name: String
    var functionName: String
    var caseName: String
    
}

extension BlackboardColor {
    
    init(_ colorSet: ColorSet) {
        red = colorSet.red
        green = colorSet.green
        blue = colorSet.blue
        alpha = colorSet.alpha
        
        name = colorSet.name
        
        functionName = Naming.methodName(fromIdentifier: colorSet.name)
            .removingSuffix("Color")
        
        caseName = functionName
    }
    
}

extension BlackboardColor {
    
    fileprivate func roundedIntValue(_ double: Double) -> Int {
        return Int((double * 255).rounded())
    }
    
    var redIntValue: Int {
        return roundedIntValue(red)
    }
    
    var greenIntValue: Int {
        return roundedIntValue(green)
    }
    
    var blueIntValue: Int {
        return roundedIntValue(blue)
    }
    
}

fileprivate let roundedStringValueFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumIntegerDigits = 1
    formatter.minimumFractionDigits = 1
    formatter.maximumFractionDigits = 3
    return formatter
}()

extension BlackboardColor {
    
    fileprivate func roundedStringValue(_ double: Double) -> String {
        return roundedStringValueFormatter.string(for: double)!
    }
    
    var redStringValue: String {
        return roundedStringValue(red)
    }
    
    var greenStringValue: String {
        return roundedStringValue(green)
    }
    
    var blueStringValue: String {
        return roundedStringValue(blue)
    }
    
    var alphaStringValue: String {
        return roundedStringValue(alpha)
    }
    
}

extension BlackboardColor {
    
    var hexValue: String {
        return String(format: "#%06X", (redIntValue << 16 + greenIntValue << 8 + blueIntValue))
    }
    
    var rgbaValue: String {
        if alpha == 1 {
            return "rgb(\(redIntValue), \(greenIntValue), \(blueIntValue))"
        }
        return "rgba(\(redIntValue), \(greenIntValue), \(blueIntValue), \(alphaStringValue))"
    }
    
}
