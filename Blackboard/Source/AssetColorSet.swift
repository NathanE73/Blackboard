//
//  AssetColorSet.swift
//  Blackboard
//
//  Created by Nate Walczak on 7/25/17.
//  Copyright © 2017 Nathan E. Walczak. All rights reserved.
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
        let idiom: String
        let color: Color
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
        let red: Float
        let green: Float
        let blue: Float
        let alpha: Float
    }
    
}
