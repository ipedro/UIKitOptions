//
//  UITextView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

// MARK: - UITextView Extension

public extension UITextView {
    convenience init(text: String? = nil, options: Options...) {
        self.init()
        
        if let text = text {
            self.text = text
        }
        
        self.applyOptions(options)
    }
    
    convenience init(attributedText: NSAttributedString?, options: Options...) {
        self.init()
        
        if let attributedText = attributedText {
            self.attributedText = attributedText
        }
        
        self.applyOptions(options)
    }
}
