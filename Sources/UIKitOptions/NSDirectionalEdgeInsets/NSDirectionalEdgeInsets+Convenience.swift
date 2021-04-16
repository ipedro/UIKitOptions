//
//  NSDirectionalEdgeInsets+Convenience.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension NSDirectionalEdgeInsets {
    
    static func insets(
        top: CGFloat = .zero,
        leading: CGFloat = .zero,
        bottom: CGFloat = .zero,
        trailing: CGFloat = .zero
    ) -> NSDirectionalEdgeInsets {
        self.init(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    var vertical: CGFloat { top + bottom }
    
    var horizontal: CGFloat { leading + trailing }
    
    func edgeInsets() -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
    }
    
    func rightToLeftEdgeInsets() -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: trailing, bottom: bottom, right: leading)
    }
}
