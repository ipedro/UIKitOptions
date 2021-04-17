//
//  UIEdgeInsets+Convenience.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIEdgeInsets {
    
    init(top: CGFloat?, left: CGFloat?, bottom: CGFloat?, right: CGFloat?) {
        self.init(
            top: top ?? .zero,
            left: left ?? .zero,
            bottom: bottom ?? .zero,
            right: right ?? .zero
        )
    }
    
    init<T: RawRepresentable>(top: T?, left: T?, bottom: T?, right: T?) where T.RawValue == CGFloat {
        self.init(
            top: top?.rawValue ?? .zero,
            left: left?.rawValue ?? .zero,
            bottom: bottom?.rawValue ?? .zero,
            right: right?.rawValue ?? .zero
        )
    }
    
    var verticalInsets: CGFloat { top + bottom }
    
    var horizontalInsets: CGFloat { left + right }
    
    func directionalEdgeInsets() -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
    
    func rightToLeftDirectionalEdgeInsets() -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: top, leading: right, bottom: bottom, trailing: left)
    }
}
