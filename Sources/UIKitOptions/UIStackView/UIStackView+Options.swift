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
    func apply(stackViewOptions: Option...){
        apply(stackViewOptions: stackViewOptions)
    }
    
    /// Applies the appeareance options to the stack view instance.
    /// - Parameter options: The stack view appearance options.
    func apply(stackViewOptions: Options) {
        stackViewOptions.forEach { option in
            switch option {
            case let .spacing(spacing):
                self.spacing = spacing
                
            case let .verticalAlignment(verticalAlignment):
                self.alignment = verticalAlignment.rawValue
                
            case let .horizontalAlignment(horizontalAlignment):
                self.alignment = horizontalAlignment.rawValue
                
            case let .distribution(distribution):
                self.distribution = distribution
                
            case let .arrangedSubviews(views):
                addArrangedSubviews(views)
                
            case let .isLayoutMarginsRelativeArrangement(isLayoutMarginsRelativeArrangement):
                self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
                
            case let .viewOptions(viewOptions):
                apply(viewOptions: viewOptions)
            }
        }
    }
    
    typealias Options = [Option]
    
    /// An object that defines the appearance of a stack view.
    enum Option {
        
        /// The list of views arranged by the stack view.
        case arrangedSubviews([UIView])
        
        /// The distance in points between the adjacent edges of the stack view’s arranged views.
        case spacing(CGFloat)
        
        /// The alignment of the arranged subviews perpendicular to the stack view’s axis.
        case verticalAlignment(VerticalAlignment)
        
        /// The alignment of the arranged subviews perpendicular to the stack view’s axis.
        case horizontalAlignment(HorizontalAlignment)
        
        /// The distribution of the arranged views along the stack view’s axis.
        case distribution(UIStackView.Distribution)
        
        /// A Boolean value that determines whether the stack view lays out its arranged views relative to its layout margins.
        case isLayoutMarginsRelativeArrangement(Bool)
        
        /// The appearance options of the stack view.
        case viewOptions(UIView.Options)
        
        // MARK: - Convenience
        
        /// The list of views arranged by the stack view.
        public static func arrangedSubviews(_ views: UIView...) -> Self {
            .arrangedSubviews(views)
        }
        
        public static func spacing<T: RawRepresentable>(_ spacing: T) -> Self where T.RawValue == CGFloat {
            .spacing(spacing.rawValue)
        }
        
        /// The appearance options of the stack view.
        public static func viewOptions(_ options: UIView.Option...) -> Self {
            .viewOptions(options)
        }
        
        /// Describes the stack view layer's appearance.
        public static func layerOptions(_ options: CALayer.Option...) -> Self {
            .viewOptions(.layerOptions(options))
        }
        
        /// The priority with which a view resists being made smaller than its intrinsic width or height.
        public static func compressionResistance(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
            .viewOptions(.layoutCompression(.compressionResistance(priority, for: axis)))
        }
        
        /// The priority with which a view resists being made larger than its intrinsic width or height.
        public static func huggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
            .viewOptions(.layoutCompression(.huggingPriority(priority, for: axis)))
        }
        
        /// The default spacing to use when laying out content in a view, taking into account the current language direction.
        public static func directionalLayoutMargins(_ insets: NSDirectionalEdgeInsets) -> Self {
            .viewOptions(.directionalLayoutMargins(insets))
        }
        
        /// The default spacing to use when laying out content in a view, taking into account the current language direction.
        public static func directionalLayoutMargins(top: CGFloat = .zero, leading: CGFloat = .zero, bottom: CGFloat = .zero, trailing: CGFloat = .zero) -> Self {
            .directionalLayoutMargins(NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing))
        }
        
        /// The default spacing to use when laying out content in a view, taking into account the current language direction.
        public static func directionalLayoutMargins(horizontal: CGFloat = .zero, vertical: CGFloat = .zero) -> Self {
            .directionalLayoutMargins(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
        }
        
        /// The default spacing to use when laying out content in a view, taking into account the current language direction.
        public static func directionalLayoutMargins<T: RawRepresentable>(top: T? = nil, leading: T? = nil, bottom: T? = nil, trailing: T? = nil) -> Self where T.RawValue == CGFloat {
            .directionalLayoutMargins(top: top?.rawValue ?? .zero, leading: leading?.rawValue ?? .zero, bottom: bottom?.rawValue ?? .zero, trailing: trailing?.rawValue ?? .zero)
        }
        
        /// The default spacing to use when laying out content in a view, taking into account the current language direction.
        public static func directionalLayoutMargins<T: RawRepresentable>(horizontal: T? = nil, vertical: T? = nil) -> Self where T.RawValue == CGFloat {
            .directionalLayoutMargins(top: vertical?.rawValue ?? .zero, leading: horizontal?.rawValue ?? .zero, bottom: vertical?.rawValue ?? .zero, trailing: horizontal?.rawValue ?? .zero)
        }
    }
}
