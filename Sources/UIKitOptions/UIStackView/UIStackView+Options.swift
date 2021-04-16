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
    func applyOptions(_ options: Options) {
        axis                               = options.axis
        spacing                            = options.spacing
        directionalLayoutMargins           = options.layoutMargins
        alignment                          = options.alignment
        distribution                       = options.distribution
        isLayoutMarginsRelativeArrangement = options.isLayoutMarginsRelativeArrangement
        
        if let viewOptions = options.viewOptions {
            applyOptions(viewOptions)
        }
    }
    
    /// An object that defines the appearance of a stack view.
    struct Options: Equatable {
        /// The axis along which the arranged views are laid out.
        public var axis: NSLayoutConstraint.Axis
        
        /// The distance in points between the adjacent edges of the stack view’s arranged views.
        public var spacing: CGFloat
        
        /// The optional margins of the UIStackView contents.
        public var layoutMargins: NSDirectionalEdgeInsets
        
        /// The alignment of the arranged subviews perpendicular to the stack view’s axis.
        public var alignment: UIStackView.Alignment
        
        /// The distribution of the arranged views along the stack view’s axis.
        public var distribution: UIStackView.Distribution
        
        /// A Boolean value that determines whether the stack view lays out its arranged views relative to its layout margins.
        public var isLayoutMarginsRelativeArrangement: Bool = true
        
        /// The optional appearance options of the view.
        public var viewOptions: UIView.Options?
        
        /// Vertical arrangement with zero spacing between subviews.
        ///
        /// Initializes a stack view configurator object with **vertical** axis.
        /// - Parameters:
        ///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views.
        ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis.
        ///   - distribution: The distribution of the arranged views along the stack view’s axis.
        ///   - margins: The optional margins of the UIStackView contents.
        /// - Returns: A stack view configurator object.
        static func verticalAxis(
            spacing: CGFloat = .zero,
            layoutMargins: NSDirectionalEdgeInsets = .zero,
            alignment: VerticalAlignment = .fill,
            distribution: UIStackView.Distribution = .fill,
            viewOptions: UIView.Options? = nil
        ) -> Options {
            return Options(
                axis: .vertical,
                spacing: spacing,
                layoutMargins: layoutMargins,
                alignment: alignment.rawValue,
                distribution: distribution,
                viewOptions: viewOptions
            )
        }
        
        /// Initializes a stack view configurator object with **horizontal** axis.
        /// - Parameters:
        ///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views.
        ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis.
        ///   - distribution: The distribution of the arranged views along the stack view’s axis.
        ///   - margins: The optional margins of the UIStackView contents.
        /// - Returns: A stack view configurator object.
        static func horizontalAxis(
            spacing: CGFloat = .zero,
            layoutMargins: NSDirectionalEdgeInsets = .zero,
            alignment: HorizontalAlignment = .fill,
            distribution: UIStackView.Distribution = .fill,
            viewOptions: UIView.Options? = nil
        ) -> Options {
            return Options(
                axis: .horizontal,
                spacing: spacing,
                layoutMargins: layoutMargins,
                alignment: alignment.rawValue,
                distribution: distribution,
                viewOptions: viewOptions
            )
        }
    }
}

