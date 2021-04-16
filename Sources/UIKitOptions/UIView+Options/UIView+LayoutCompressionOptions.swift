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
    func applyOptions(_ options: UIView.LayoutCompressionOptions) {
        if let horizontalCompressionResistance = options.horizontalCompressionResistance {
            setContentCompressionResistancePriority(horizontalCompressionResistance, for: .horizontal)
        }
        if let verticalCompressionResistance = options.verticalCompressionResistance {
            setContentCompressionResistancePriority(verticalCompressionResistance, for: .vertical)
        }
        if let horizontalHuggingPriority = options.horizontalHuggingPriority {
            setContentHuggingPriority(horizontalHuggingPriority, for: .horizontal)
        }
        if let verticalHuggingPriority = options.verticalHuggingPriority {
            setContentHuggingPriority(verticalHuggingPriority, for: .vertical)
        }
    }
    
    /// Describes the view's layout compression and hugging priorities.
    struct LayoutCompressionOptions: Equatable {
        /// The priority with which a view resists being made smaller than its intrinsic width.
        public var horizontalCompressionResistance: UILayoutPriority?
        
        /// The priority with which a view resists being made larger than its intrinsic width.
        public var horizontalHuggingPriority: UILayoutPriority?
        
        /// The priority with which a view resists being made smaller than its intrinsic height.
        public var verticalCompressionResistance: UILayoutPriority?
        
        /// The priority with which a view resists being made larger than its intrinsic height.
        public var verticalHuggingPriority: UILayoutPriority?
        
        public init(
            horizontalCompressionResistance: UILayoutPriority? = nil,
            horizontalHugging: UILayoutPriority? = nil,
            verticalCompressionResistance: UILayoutPriority? = nil,
            verticalHugging: UILayoutPriority? = nil
        ) {
            self.horizontalCompressionResistance = horizontalCompressionResistance
            self.horizontalHuggingPriority       = horizontalHugging
            self.verticalCompressionResistance   = verticalCompressionResistance
            self.verticalHuggingPriority         = verticalHugging
        }
    }
}
