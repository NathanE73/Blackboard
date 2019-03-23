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

let PhotoStoryboardSwiftSource = """
//
//  Photo.blackboard.swift
//
//  This file is automatically generated; do not modify.
//

import UIKit

private let sharedStoryboardInstance = UIStoryboard(name: "Photo", bundle: nil)

extension PhotoViewController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ photoViewController: PhotoViewController) -> Void)? = nil) -> PhotoViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "PhotoViewController", initialize)
    }
    
    final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ photoViewController: PhotoViewController) -> Void)? = nil) -> UINavigationController {
        return instantiateNavigationController(from: sharedStoryboardInstance, identifier: "PhotoNavigationController", initialize)
    }
    
}

protocol PhotosCollectionViewControllerSegues {}

extension PhotosCollectionViewControllerSegues {
    func prepareForShowPhotoSegue(_ photoViewController: PhotoViewController) {}
    
    func shouldPerformShowPhotoSegue() -> Bool { return true }
}

extension PhotosCollectionViewController: PhotosCollectionViewControllerSegues {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ photosCollectionViewController: PhotosCollectionViewController) -> Void)? = nil) -> PhotosCollectionViewController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "PhotoCollectionViewController", initialize)
    }
    
    final class func instantiateNavigationControllerFromStoryboard(_ initialize: ((_ photosCollectionViewController: PhotosCollectionViewController) -> Void)? = nil) -> UINavigationController {
        return instantiateNavigationController(from: sharedStoryboardInstance, identifier: "PhotosNavigationController", initialize)
    }
    
    // Segues
    
    enum SegueIdentifier: String {
        case showPhoto = "Show Photo"
    }
    
    final override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueInitialization = sender as? SegueInitialization {
            segueInitialization.block(segue.destination)
            return
        }
        
        guard let identifier = segue.identifier else {
            return
        }
        
        switch SegueIdentifier(rawValue: identifier) {
        case .showPhoto?:
            let viewController = segue.destination as! PhotoViewController
            prepareForShowPhotoSegue(viewController)
        case .none:
            break
        }
    }
    
    final override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch SegueIdentifier(rawValue: identifier) {
        case .showPhoto?:
            return shouldPerformShowPhotoSegue()
        case .none:
            return true
        }
    }
    
    final func performShowPhotoSegue(_ initialize: ((PhotoViewController) -> Void)? = nil) {
        performViewControllerSegue(SegueIdentifier.showPhoto.rawValue, initialize)
    }
    
    // Collection View Cells
    
    enum CollectionViewCellIdentifier: String {
        case photo = "Photo"
    }
    
    final func dequeuePhotoCell(from collectionView: UICollectionView, for indexPath: IndexPath, initialize: ((_ photoCell: PhotoCollectionViewCell) -> Void)? = nil) -> PhotoCollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.photo.rawValue, for: indexPath, initialize)
    }
    
}

extension PhotosNavigationController {
    
    final class func instantiateFromStoryboard(_ initialize: ((_ photosNavigationController: PhotosNavigationController) -> Void)? = nil) -> PhotosNavigationController {
        return instantiateViewController(from: sharedStoryboardInstance, identifier: "PhotosNavigationController", initialize)
    }
    
}

"""
