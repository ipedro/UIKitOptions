//
//  UILabel+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

// MARK: - UILabel Extension

public extension UILabel {
    convenience init(_ options: Option...) {
        self.init()
        apply(labelOptions: options)
    }
}
