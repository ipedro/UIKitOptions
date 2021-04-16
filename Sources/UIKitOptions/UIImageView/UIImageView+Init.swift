//
//  UIImageView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIImageView {
    
    convenience init(_ options: Option...) {
        self.init()
        apply(imageViewOptions: options)
    }
    
}
