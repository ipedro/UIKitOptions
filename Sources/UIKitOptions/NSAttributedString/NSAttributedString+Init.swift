//
//  NSAttributedString+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 17.04.21.
//

import UIKit

public typealias AttributedString = NSAttributedString

public extension NSAttributedString {
    /// Creates an attributed string with the specified string and attributes.
    /// - Parameters:
    ///   - string: The string for the new attributed string.
    ///   - options: The attributes for the new attributed string.
    convenience init (_ string: String, _ options: Option...) {
        self.init(string, options)
    }
    
    /// Creates an attributed string with the specified string and attributes.
    /// - Parameters:
    ///   - string: The string for the new attributed string.
    ///   - options: The attributes for the new attributed string.
    convenience init (_ string: String, _ options: Options) {
        self.init(string: string, attributes: .options(options))
    }
}
