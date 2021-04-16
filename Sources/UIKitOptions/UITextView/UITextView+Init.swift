//
//  UITextView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

// MARK: - UITextView Extension

public extension UITextView {
    convenience init(text: String? = nil, options: Option...) {
        self.init()
        
        if let text = text {
            self.text = text
        }
        
        apply(textViewOptions: options)
    }
    
    convenience init(attributedText: NSAttributedString?, options: Option...) {
        self.init()
        
        if let attributedText = attributedText {
            self.attributedText = attributedText
        }
        
        apply(textViewOptions: options)
    }
}
