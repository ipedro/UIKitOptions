//
//  UIStepper+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIStepper {
    
    convenience init(frame: CGRect = .zero, options: Options) {
        self.init(frame: frame)
        
        applyOptions(options)
    }
}
