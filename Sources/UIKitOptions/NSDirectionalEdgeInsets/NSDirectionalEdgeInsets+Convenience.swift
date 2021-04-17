//
//  NSDirectionalEdgeInsets+Convenience.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension NSDirectionalEdgeInsets {
    
    init(top: CGFloat?, leading: CGFloat?, bottom: CGFloat?, trailing: CGFloat?) {
        self.init(
            top: top ?? .zero,
            leading: leading ?? .zero,
            bottom: bottom ?? .zero,
            trailing: trailing ?? .zero
        )
    }
    
    init<T: RawRepresentable>(top: T?, leading: T?, bottom: T?, trailing: T?) where T.RawValue == CGFloat {
        self.init(
            top: top?.rawValue ?? .zero,
            leading: leading?.rawValue ?? .zero,
            bottom: bottom?.rawValue ?? .zero,
            trailing: trailing?.rawValue ?? .zero
        )
    }
    
    var verticalInsets: CGFloat { top + bottom }
    
    var horizontalInsets: CGFloat { leading + trailing }
    
    func edgeInsets() -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
    }
    
    func rightToLeftEdgeInsets() -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: trailing, bottom: bottom, right: leading)
    }
}
