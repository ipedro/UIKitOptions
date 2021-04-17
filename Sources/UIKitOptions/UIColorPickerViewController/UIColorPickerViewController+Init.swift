//
//  UIColorPickerViewController+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 18.04.21.
//

import UIKit

#if swift(>=5.3)
@available(iOS 14.0, *)
public extension UIColorPickerViewController {
    convenience init(_ options: Option...) {
        self.init(options)
    }
    
    convenience init(_ options: Options) {
        self.init()
        apply(colorPickerOptions: options)
    }
}
#endif
