//
//  UITextView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UITextView {
    convenience init(_ options: Option...) {
        self.init(options)
    }
    
    convenience init(_ options: Options) {
        self.init()
        apply(textViewOptions: options)
    }
}
