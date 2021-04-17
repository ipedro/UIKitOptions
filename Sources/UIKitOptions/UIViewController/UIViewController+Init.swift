//
//  UIViewController+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 18.04.21.
//

import UIKit

public extension UIViewController {
    
    convenience init(_ options: Option...) {
        self.init(options)
    }
    
    convenience init(_ options: Options) {
        self.init()
        apply(viewControllerOptions: options)
    }
}
