//
//  UINavigationController+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 21.04.21.
//

import UIKit

public extension UINavigationController {
    convenience init(_ options: Option...) {
        self.init()
        apply(navigationControllerOptions: options)
    }
}
