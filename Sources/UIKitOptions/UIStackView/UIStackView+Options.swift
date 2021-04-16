//
//  UIStackView+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIStackView {
    /// Applies the appeareance options to the stack view instance.
    /// - Parameter options: The stack view appearance options.
    func apply(stackViewOptions: Option...) {
        apply(stackViewOptions: stackViewOptions)
    }
    
    /// Applies the appeareance options to the stack view instance.
    /// - Parameter options: The stack view appearance options.
    func apply(stackViewOptions: Options) {
        stackViewOptions.forEach { option in
            switch option {
            case let .axis(axis):
                self.axis = axis
                
            case let .spacing(spacing):
                self.spacing = spacing
                
            case let .layoutMargins(layoutMargins):
                self.directionalLayoutMargins = layoutMargins
                self.isLayoutMarginsRelativeArrangement = true
                
            case let .alignment(alignment):
                self.alignment = alignment
                
            case let .distribution(distribution):
                self.distribution = distribution
                
            case let .isLayoutMarginsRelativeArrangement(isLayoutMarginsRelativeArrangement):
                self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
                
            case let .viewOptions(viewOptions):
                apply(viewOptions: viewOptions)
                
            }
        }
    }
        
    typealias Options = [Option]
    
    /// An object that defines the appearance of a stack view.
    enum Option: Equatable {
        /// The axis along which the arranged views are laid out.
        case axis(NSLayoutConstraint.Axis)
        
        /// The distance in points between the adjacent edges of the stack view’s arranged views.
        case spacing(CGFloat)
        
        /// The optional margins of the UIStackView contents.
        case layoutMargins(NSDirectionalEdgeInsets)
        
        /// The alignment of the arranged subviews perpendicular to the stack view’s axis.
        case alignment(UIStackView.Alignment)
        
        /// The distribution of the arranged views along the stack view’s axis.
        case distribution(UIStackView.Distribution)
        
        /// A Boolean value that determines whether the stack view lays out its arranged views relative to its layout margins.
        case isLayoutMarginsRelativeArrangement(Bool)
        
        /// The appearance options of the stack view.
        case viewOptions(UIView.Options)
        
        /// The appearance options of the stack view.
        public static func viewOptions(_ viewOptions: UIView.Option...) -> Self {
            .viewOptions(viewOptions)
        }
        
        /// Describes the stack view layer's appearance.
        public static func layerOptions(_ layerOptions: CALayer.Option...) -> Self {
            .viewOptions(.layerOptions(layerOptions))
        }
        
        /// Describes the stack view's layout compression and hugging priorities.
        public static func layoutCompression(_ options: LayoutCompressionOption...) -> Self {
            .viewOptions(.layoutCompression(options))
        }
    }
}

