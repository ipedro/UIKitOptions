//
//  UIView+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIView {
    /// Applies the appearance options to the view instance.
    /// - Parameter viewOptions: The view appearance options.
    func apply(viewOptions: Option...) {
        apply(viewOptions: viewOptions)
    }
    
    /// Applies the appearance options to the view instance.
    /// - Parameter viewOptions: The view appearance options.
    func apply(viewOptions: Options) {
        viewOptions.forEach { option in
            switch option {
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
                
            case let .contentMode(contentMode):
                self.contentMode = contentMode
                
            case let .clipsToBounds(clipsToBounds):
                self.clipsToBounds = clipsToBounds
                
            case let .isHidden(isHidden):
                self.isHidden = isHidden
                
            case let .tintColor(tintColor):
                self.tintColor = tintColor
                
            case let .alpha(alpha):
                self.alpha = alpha
                
            case let .isUserInteractionEnabled(isUserInteractionEnabled):
                self.isUserInteractionEnabled = isUserInteractionEnabled
                
            case let .layoutCompression(layoutCompressionOptions):
                self.apply(layoutCompressionOptions: layoutCompressionOptions)
                
            case let .layerOptions(layerOptions):
                layer.apply(layerOptions: layerOptions)
            
            case let .frame(frame):
                self.frame = frame
                
            case let .bounds(bounds):
                self.bounds = bounds
                
            case let .center(center):
                self.center = center
                
            case let .transform(transform):
                self.transform = transform
                
            case let .directionalLayoutMargins(directionalLayoutMargins):
                self.directionalLayoutMargins = directionalLayoutMargins
                
            case let .preservesSuperviewLayoutMargins(preservesSuperviewLayoutMargins):
                self.preservesSuperviewLayoutMargins = preservesSuperviewLayoutMargins
                
            case let .insetsLayoutMarginsFromSafeArea(insetsLayoutMarginsFromSafeArea):
                self.insetsLayoutMarginsFromSafeArea = insetsLayoutMarginsFromSafeArea
                
            case let .tintAdjustmentMode(tintAdjustmentMode):
                self.tintAdjustmentMode = tintAdjustmentMode
                
            case let .mask(mask):
                self.mask = mask
                
            case let .tag(tag):
                self.tag = tag
                
            case let .semanticContentAttribute(semanticContentAttribute):
                self.semanticContentAttribute = semanticContentAttribute
                
            #if swift(>=5.3)
            case let .focusGroupIdentifier(focusGroupIdentifier):
                if #available(iOS 14.0, *) {
                    self.focusGroupIdentifier = focusGroupIdentifier
                }
            #endif
            }
        }
    }
    
    typealias Options = [Option]
    
    /// An object that defines the appearance of a view.
    enum Option {
        /// The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
        case frame(CGRect)
        
        /// The bounds rectangle, which describes the view’s location and size in its own coordinate system.
        case bounds(CGRect)
        
        /// The center point of the view's frame rectangle.
        case center(CGPoint)
        
        /// Specifies the transform applied to the view, relative to the center of its bounds.
        case transform(CGAffineTransform)
        
        /// The default spacing to use when laying out content in a view, taking into account the current language direction.
        case directionalLayoutMargins(NSDirectionalEdgeInsets)
        
        /// A Boolean value indicating whether the current view also respects the margins of its superview.
        case preservesSuperviewLayoutMargins(Bool)
        
        /// A Boolean value indicating whether the view's layout margins are updated automatically to reflect the safe area.
        case insetsLayoutMarginsFromSafeArea(Bool)
        
        /// The view’s background color.
        case backgroundColor(UIColor?)
        
        /// A flag used to determine how a view lays out its content when its bounds change.
        case contentMode(ContentMode)
        
        /// A Boolean value that determines whether subviews are confined to the bounds of the view.
        case clipsToBounds(Bool)
        
        /// A Boolean value that determines whether the view is hidden.
        case isHidden(Bool)
        
        /// The view's tint color.
        case tintColor(UIColor)
        
        /// The first non-default tint adjustment mode value in the view’s hierarchy, ascending from and starting with the view itself.
        case tintAdjustmentMode(UIView.TintAdjustmentMode)
        
        /// An optional view whose alpha channel is used to mask a view’s content.
        case mask(UIView?)
        
        /// The view’s alpha value.
        case alpha(CGFloat)
        
        /// An integer that you can use to identify view objects in your application.
        case tag(Int)
        
        /// A semantic description of the view’s contents, used to determine whether the view should be flipped when switching between left-to-right and right-to-left layouts.
        case semanticContentAttribute(UISemanticContentAttribute)
        
        @available(iOS 14.0, *)
        /// The identifier of the focus group that this view belongs to. If this is nil, subviews inherit their superview's focus group.
        case focusGroupIdentifier(String?)
        
        /// A Boolean value that determines whether user events are ignored and removed from the event queue.
        case isUserInteractionEnabled(Bool)
        
        /// Describes the view's layout compression and hugging priorities.
        case layoutCompression(LayoutCompressionOptions)
        
        /// Describes the layer's appearance.
        case layerOptions(CALayer.Options)
        
        // MARK: - Convenience
        
        /// Describes the layer's appearance.
        public static func layerOptions(_ layerOptions: CALayer.Option...) -> Self {
            .layerOptions(layerOptions)
        }
        
        /// Describes the view's layout compression and hugging priorities.
        public static func layoutCompression(_ options: LayoutCompressionOption...) -> Self {
            .layoutCompression(options)
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
