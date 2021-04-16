//
//  UITextView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

// MARK: - UITextView Extension

public extension UITextView {
    convenience init(_ options: Option...) {
        self.init()
        apply(textViewOptions: options)
    }
}
