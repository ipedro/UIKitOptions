//
//  UIView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIView {
    convenience init(_ options: Option...) {
        self.init(frame: .zero)
        apply(viewOptions: options)
    }
}
