//
//  NSDirectionalEdgeInsets+Convenience.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension NSDirectionalEdgeInsets {
    
    init(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) {
        self.init(
            top: top ?? .zero,
            leading: leading ?? .zero,
            bottom: bottom ?? .zero,
            trailing: trailing ?? .zero
        )
    }
    
    init(_ insets: CGFloat) {
        self.init(top: insets, leading: insets, bottom: insets, trailing: insets)
    }
    
    init(horizontal: CGFloat? = nil, vertical: CGFloat? = nil) {
        self.init(
            top: vertical ?? .zero,
            leading: horizontal ?? .zero,
            bottom: vertical ?? .zero,
            trailing: horizontal ?? .zero
        )
    }
    
    init<T: RawRepresentable>(top: T? = nil, leading: T? = nil, bottom: T? = nil, trailing: T? = nil) where T.RawValue == CGFloat {
        self.init(
            top: top?.rawValue ?? .zero,
            leading: leading?.rawValue ?? .zero,
            bottom: bottom?.rawValue ?? .zero,
            trailing: trailing?.rawValue ?? .zero
        )
    }
    
    init<T: RawRepresentable>(_ insets: T) where T.RawValue == CGFloat {
        self.init(
            top: insets.rawValue,
            leading: insets.rawValue,
            bottom: insets.rawValue,
            trailing: insets.rawValue
        )
    }
    
    init<T: RawRepresentable>(horizontal: T? = nil, vertical: T? = nil) where T.RawValue == CGFloat {
        self.init(
            top: vertical?.rawValue ?? .zero,
            leading: horizontal?.rawValue ?? .zero,
            bottom: vertical?.rawValue ?? .zero,
            trailing: horizontal?.rawValue ?? .zero
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
