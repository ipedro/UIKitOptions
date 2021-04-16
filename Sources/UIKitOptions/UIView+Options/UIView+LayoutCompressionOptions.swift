//
//  UIView+LayoutCompressionOptions.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIView {
    /// Applies the layout compression options to the view instance.
    /// - Parameter options: The view layout compresison options.
    func applyOptions(_ options: LayoutCompressionOptions...) {
        applyOptions(options)
    }
    
    /// Applies the layout compression options to the view instance.
    /// - Parameter options: The view layout compresison options.
    func applyOptions(_ options: [LayoutCompressionOptions]) {
        options.forEach { option in
            switch option {
            case let .horizontalCompressionResistance(priority):
                setContentCompressionResistancePriority(priority, for: .horizontal)
                
            case let .horizontalHuggingPriority(priority):
                setContentHuggingPriority(priority, for: .horizontal)
                
            case let .verticalCompressionResistance(priority):
                setContentCompressionResistancePriority(priority, for: .vertical)
                
            case let .verticalHuggingPriority(priority):
                setContentHuggingPriority(priority, for: .vertical)
            }
        }
    }
    
    /// Describes the view's layout compression and hugging priorities.
    enum LayoutCompressionOptions: Equatable {
        /// The priority with which a view resists being made smaller than its intrinsic width.
        case horizontalCompressionResistance(UILayoutPriority)
        
        /// The priority with which a view resists being made larger than its intrinsic width.
        case horizontalHuggingPriority(UILayoutPriority)
        
        /// The priority with which a view resists being made smaller than its intrinsic height.
        case verticalCompressionResistance(UILayoutPriority)
        
        /// The priority with which a view resists being made larger than its intrinsic height.
        case verticalHuggingPriority(UILayoutPriority)
    }
}
