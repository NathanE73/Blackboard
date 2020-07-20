//
//  Image.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import SwiftUI

private let bundle: Bundle = {
    class Object: NSObject { }
    return Bundle(for: Object.self)
}()

@available(iOS 13.0, *)
public extension Image {
    
    init(asset imageAsset: ImageAsset) {
        self.init(imageAsset.rawValue, bundle: bundle)
    }
    
    init(asset imageAsset: ImageAsset, label: Text) {
        self.init(imageAsset.rawValue, bundle: bundle, label: label)
    }
    
    init(decorativeAsset imageAsset: ImageAsset) {
        self.init(decorative: imageAsset.rawValue, bundle: bundle)
    }
    
    static var button: Image { return Image(asset: ImageAsset.button) }
    static var greenPaperClip: Image { return Image(asset: ImageAsset.greenPaperClip) }
    static var greenPencil: Image { return Image(asset: ImageAsset.greenPencil) }
    static var redCup: Image { return Image(asset: ImageAsset.redCup) }
    static var redStapler: Image { return Image(asset: ImageAsset.redStapler) }
    static var silverPaperClip: Image { return Image(asset: ImageAsset.silverPaperClip) }
    static var whiteDice: Image { return Image(asset: ImageAsset.whiteDice) }
    
}
