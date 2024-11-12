//
//  CGColor.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import CoreGraphics

public extension ColorAsset {
    var cgColor: CGColor { color.cgColor }
}

#if swift(<5.9.0)
public extension CGColor {
    static var absoluteZero: CGColor { ColorAsset.absoluteZero.cgColor }
    static var bisque: CGColor { ColorAsset.bisque.cgColor }
    static var charcoal: CGColor { ColorAsset.charcoal.cgColor }
    static var darkOliveGreen: CGColor { ColorAsset.darkOliveGreen.cgColor }
    static var desire: CGColor { ColorAsset.desire.cgColor }
    static var emerald: CGColor { ColorAsset.emerald.cgColor }
    static var empty: CGColor { ColorAsset.empty.cgColor }
    static var firebrick: CGColor { ColorAsset.firebrick.cgColor }
    enum Fluorescent {
        static var blizzardBlue: CGColor { ColorAsset.Fluorescent.blizzardBlue.cgColor }
        static var magicMint: CGColor { ColorAsset.Fluorescent.magicMint.cgColor }
        static var radicalRed: CGColor { ColorAsset.Fluorescent.radicalRed.cgColor }
    }
    static var maroon: CGColor { ColorAsset.maroon.cgColor }
    static var night: CGColor { ColorAsset.night.cgColor }
}
#endif
