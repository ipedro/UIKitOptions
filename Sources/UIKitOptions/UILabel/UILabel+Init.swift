//
//  UILabel+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

// MARK: - UILabel Extension

public extension UILabel {
    convenience init(text: String? = nil, options: Option...) {
        self.init()
        
        self.text = text
        
        apply(labelOptions: options)
    }
    
    convenience init(attributedText: NSAttributedString, options: Option...) {
        self.init()
        
        self.attributedText = attributedText
        
        apply(labelOptions: options)
    }
}
