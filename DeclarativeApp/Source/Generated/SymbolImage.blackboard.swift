//
//  SymbolImage.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import SwiftUI

public extension Image {
    
    init(symbol symbolAsset: SymbolAsset) {
        self.init(systemName: symbolAsset.name)
    }
    
    @available(iOS, introduced: 14.0, deprecated: 14.2, renamed: "symbolCharacterBookClosed")
    static var symbolABookClosed: Image { Image(symbol: .aBookClosed) }
    @available(iOS 14.0, *)
    static var symbolCase: Image { Image(symbol: .case) }
    @available(iOS 14.0, *)
    static var symbolCaseFill: Image { Image(symbol: .caseFill) }
    @available(iOS 14.2, *)
    static var symbolCharacterBookClosed: Image { Image(symbol: .characterBookClosed) }
    static var symbolChevronDown: Image { Image(symbol: .chevronDown) }
    static var symbolChevronUp: Image { Image(symbol: .chevronUp) }
    @available(iOS 14.0, *)
    static var symbolDieFace1: Image { Image(symbol: .dieFace1) }
    @available(iOS 14.0, *)
    static var symbolDieFace4: Image { Image(symbol: .dieFace4) }
    @available(iOS 14.2, *)
    static var symbolInfinityCircleFill: Image { Image(symbol: .infinityCircleFill) }
    static var symbolMinusCircleFill: Image { Image(symbol: .minusCircleFill) }
    static var symbolNumber14SquareFill: Image { Image(symbol: .number14SquareFill) }
    static var symbolPerson: Image { Image(symbol: .person) }
    static var symbolPerson2: Image { Image(symbol: .person2) }
    static var symbolPlusCircleFill: Image { Image(symbol: .plusCircleFill) }
    static var symbolRepeat: Image { Image(symbol: .repeat) }
    @available(iOS 14.2, *)
    static var symbolRepeatCircle: Image { Image(symbol: .repeatCircle) }
    static var symbolReturn: Image { Image(symbol: .return) }
    
}

@available(iOS 14.0, *)
public extension Label where Title == Text, Icon == Image {
    
    init(_ titleKey: LocalizedStringKey, symbol symbolAsset: SymbolAsset) {
        self.init(titleKey, systemImage: symbolAsset.name)
    }
    
    init<S>(_ title: S, symbol symbolAsset: SymbolAsset) where S: StringProtocol {
        self.init(title, systemImage: symbolAsset.name)
    }
    
}
