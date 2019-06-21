//
//  Image.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import SwiftUI

fileprivate let bundle: Bundle = {
    class Object: NSObject { }
    return Bundle(for: Object.self)
}()

@available(iOS 13.0, *)
public extension Image {
    
    init(_ imageAsset: ImageAsset) {
        self.init(imageAsset.rawValue, bundle: bundle)
    }
    
    init(_ imageAsset: ImageAsset, label: Text) {
        self.init(imageAsset.rawValue, bundle: bundle, label: label)
    }
    
    init(decorative imageAsset: ImageAsset) {
        self.init(decorative: imageAsset.rawValue, bundle: bundle)
    }
    
}
