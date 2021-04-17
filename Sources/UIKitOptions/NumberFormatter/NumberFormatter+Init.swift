//
//  NumberFormatter+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 17.04.21.
//

import Foundation

public extension NumberFormatter {
    convenience init(_ options: Option...) {
        self.init(options)
    }
    
    convenience init(_ options: Options) {
        self.init()
        apply(numberFormatterOptions: options)
    }
}
