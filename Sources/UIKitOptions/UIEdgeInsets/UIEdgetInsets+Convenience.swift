//
//  UIEdgeInsets+Convenience.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIEdgeInsets {
    
    static func insets(
        top: CGFloat = .zero,
        left: CGFloat = .zero,
        bottom: CGFloat = .zero,
        right: CGFloat = .zero
    ) -> UIEdgeInsets {
        self.init(top: top, left: left, bottom: bottom, right: right)
    }
    
    var vertical: CGFloat { top + bottom }
    
    var horizontal: CGFloat { left + right }
    
    func directionalEdgeInsets() -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
    
    func rightToLeftDirectionalEdgeInsets() -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: top, leading: right, bottom: bottom, trailing: left)
    }
}
