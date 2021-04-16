//
//  UIStackView+Alignment.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

// MARK: - Horizontal Alignment

public extension UIStackView {
    /// The layout of arranged views vertically to the stack view.
    enum HorizontalAlignment {
        /// Align the leading and trailing edges of horizontally stacked items tightly to the container.
        case fill
        /// A layout for horizontal stacks where the stack view aligns the top edge of its arranged views along its top edge. This is equivalent to the UIStackView.Alignment.leading alignment for vertical stacks.
        case top
        /// A layout where the stack view aligns its arranged views based on their first baseline.
        case firstBaseline
        /// A layout where the stack view aligns its arranged views based on their last baseline.
        case lastBaseline
        /// Center the items in a horizontal stack vertically
        case center
        /// A layout for horizontal stacks where the stack view aligns the bottom edge of its arranged views along its bottom edge. This is equivalent to the UIStackView.Alignment.trailing alignment for vertical stacks.
        case bottom
        
        public var rawValue: UIStackView.Alignment {
            switch self {
            case .fill:
                return .fill
                
            case .center:
                return .center
                
            case .top:
                return .top
                
            case .firstBaseline:
                return .firstBaseline
                
            case .lastBaseline:
                return .lastBaseline
                
            case .bottom:
                return .bottom
            }
        }
    }
}

// MARK: - Vertical Alignment

public extension UIStackView {
    /// The layout of arranged views horizontally to the stack view.
    enum VerticalAlignment {
        /// Align the leading and trailing edges of vertically stacked items tightly to the container.
        case fill
        /// A layout for vertical stacks where the stack view aligns the leading edge of its arranged views along its leading edge. This is equivalent to the top alignment for horizontal stacks.
        case leading
        /// Center the items in a vertical stack horizontally.
        case center
        /// A layout for vertical stacks where the stack view aligns the trailing edge of its arranged views along its trailing edge. This is equivalent to the bottom alignment for horizontal stacks.
        case trailing
        
        public var rawValue: UIStackView.Alignment {
            switch self {
            case .fill:
                return .fill
                
            case .center:
                return .center
                
            case .leading:
                return .leading
                
            case .trailing:
                return .trailing
            }
        }
    }
}
