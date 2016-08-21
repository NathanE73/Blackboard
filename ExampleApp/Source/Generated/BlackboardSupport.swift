//
//  BlackboardSupport.swift
//  ExampleApp
//
//  Created by Jon Shier on 8/19/16.
//  Copyright © 2016 Nathan E. Walczak. All rights reserved.
//

import UIKit

struct ViewControllerInitializer {
    
    let initializer: ((UIViewController) -> Void)?
    
}

extension UIViewController {
    
    func handleSegue(_ segue: UIStoryboardSegue, sender: Any?) {
        guard let viewControllerInitializer = sender as? ViewControllerInitializer else { return }
        
        viewControllerInitializer.initializer?(segue.destination)
    }
    
}

enum Storyboards: String {
    case table = "Table"
    case main = "Main"
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
}
