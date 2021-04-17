//
//  UIView+LayoutCompressionOptions.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIView {
    /// Applies the layout compression options to the view instance.
    /// - Parameter layoutCompressionOptions: The view layout compresison options.
    func apply(layoutCompressionOptions: LayoutCompressionOption...) {
        apply(layoutCompressionOptions: layoutCompressionOptions)
    }
    
    /// Applies the layout compression options to the view instance.
    /// - Parameter layoutCompressionOptions: The view layout compresison options.
    func apply(layoutCompressionOptions: LayoutCompressionOptions) {
        layoutCompressionOptions.forEach { option in
            switch option {
            case let .compressionResistance(priority, for: axis):
                setContentCompressionResistancePriority(priority, for: axis)
                
            case let .huggingPriority(priority, for: axis):
                setContentHuggingPriority(priority, for: axis)
            }
        }
    }
    
    typealias LayoutCompressionOptions = [LayoutCompressionOption]
    
    /// Describes the view's layout compression and hugging priorities.
    enum LayoutCompressionOption: Equatable {
        /// The priority with which a view resists being made smaller than its intrinsic width or height.
        case compressionResistance(UILayoutPriority, for: NSLayoutConstraint.Axis)
        
        /// The priority with which a view resists being made larger than its intrinsic width or height.
        case huggingPriority(UILayoutPriority, for: NSLayoutConstraint.Axis)
    }
}
