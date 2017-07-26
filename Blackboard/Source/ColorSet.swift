//
//  ColorSet.swift
//  Blackboard
//
//  Created by Nate Walczak on 7/26/17.
//  Copyright © 2017 Nathan E. Walczak. All rights reserved.
//

import Foundation

struct ColorSet {
    
    let name: String
    
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    
}

extension ColorSet {
    
    init?(url: URL) {
        let contentsURL = url.appendingPathComponent("Contents.json")
        guard let data = try? Data(contentsOf: contentsURL) else {
            return nil
        }
        
        guard let assetColorSet = try? JSONDecoder().decode(AssetColorSet.self, from: data) else {
            return nil
        }

        let universalColor = assetColorSet.colors.first { color in
            return color.isUniversal
        }
        
        guard let components = universalColor?.color.components else {
            return nil
        }
        
        red = components.red
        green = components.green
        blue = components.blue
        alpha = components.alpha
        
        name = url.lastPathComponent.deletingPathExtension
    }
    
    init?(path: String) {
        let url = URL(fileURLWithPath: path, isDirectory: false)
        self.init(url: url)
    }
    
    static func colorSetsAt(path: String) -> [ColorSet] {
        var files: [String] = []
        
        let fileManager = FileManager.default
        
        let enumerator = fileManager.enumerator(atPath: path)
        while let file = enumerator?.nextObject() as? String {
            if file.pathExtension == "colorset" {
                files.append(path.appendingPathComponent(file))
            }
        }
        
        files.sort(by: <)
        
        return files.flatMap { ColorSet(path: $0) }
    }
    
}
