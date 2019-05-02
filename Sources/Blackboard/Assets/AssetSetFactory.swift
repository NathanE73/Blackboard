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

protocol AssetSetFactory {
    
    associatedtype AssetSet
    
    var fileManager: FileManager { get }
    
    var pathExtension: String { get }
    
    func asset(name: String, data: Data) -> AssetSet?
    
}

extension AssetSetFactory {
    
    func assetsAt(path: String, namespace: String?) -> [AssetSet] {
        guard let contents = try? fileManager.contentsOfDirectory(atPath: path) else {
            return []
        }
        
        return contents.flatMap { content -> [AssetSet] in
            let file = path.appendingPathComponent(content)
            
            guard fileManager.isDirectory(file) else {
                return []
            }
            
            if file.pathExtension == pathExtension {
                if let asset = assetAt(path: file, namespace: namespace) {
                    return [asset]
                }
                return []
            }
            
            if providesNamespaceAt(path: file) {
                let namespace = Naming.namespace(from: namespace, content)
                return assetsAt(path: file, namespace: namespace)
            }
            return assetsAt(path: file, namespace: namespace)
        }
    }
    
    func assetAt(path: String, namespace: String?) -> AssetSet? {
        let url = URL(fileURLWithPath: path, isDirectory: false)
        
        let contentsURL = url.appendingPathComponent("Contents.json")
        guard let data = try? Data(contentsOf: contentsURL) else {
            return nil
        }
        
        let name = Naming.namespace(from: namespace, url.lastPathComponent.deletingPathExtension)!
        
        return asset(name: name, data: data)
    }
    
    func providesNamespaceAt(path: String) -> Bool {
        let assetGroup = assetGroupAt(path: path)
        
        return assetGroup?.properties?.providesNamespace == true
    }
    
    func assetGroupAt(path: String) -> AssetGroup? {
        let url = URL(fileURLWithPath: path, isDirectory: false)
        
        let contentsURL = url.appendingPathComponent("Contents.json")
        guard let data = try? Data(contentsOf: contentsURL) else {
            return nil
        }
        
        return try? JSONDecoder().decode(AssetGroup.self, from: data)
    }
    
}
