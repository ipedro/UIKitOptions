//
//  UIView+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIView {
    /// Applies the appearance options to the view instance.
    /// - Parameter options: The view appearance options.
    func applyOptions(_ options: UIView.Options) {
        backgroundColor    = options.backgroundColor
        contentMode        = options.contentMode
        isHidden           = options.isHidden
        layer.cornerRadius = options.cornerRadius
        clipsToBounds      = options.clipsToBounds
        tintColor          = options.tintColor
        alpha              = options.alpha
        
        if let userInteractionEnabled = options.isUserInteractionEnabled {
            isUserInteractionEnabled = userInteractionEnabled
        }
        if let layoutCompressionOptions = options.layoutCompression {
            applyOptions(layoutCompressionOptions)
        }
        if let layerOptions = options.layerOptions {
            layer.applyOptions(layerOptions)
        }
    }
    
    /// An object that defines the appearance of a view.
    struct Options: Equatable {
        /// The view’s background color.
        public var backgroundColor: UIColor?
        
        /// A flag used to determine how a view lays out its content when its bounds change.
        public var contentMode: UIView.ContentMode
        
        /// The radius to use when drawing rounded corners for the layer’s background.
        public var cornerRadius: CGFloat
        
        /// A Boolean value that determines whether subviews are confined to the bounds of the view.
        public var clipsToBounds: Bool
        
        /// A Boolean value that determines whether the view is hidden.
        public var isHidden: Bool
        
        /// The view's tint color.
        public var tintColor: UIColor?
        
        /// The view’s alpha value.
        public var alpha: CGFloat
        
        /// Describes the view's layout compression and hugging priorities.
        public var layoutCompression: LayoutCompressionOptions?
        
        /// /// Describes the layer's appearance.
        public var layerOptions: CALayer.Options?
        
        /// A Boolean value that determines whether user events are ignored and removed from the event queue.
        var isUserInteractionEnabled: Bool?
        
        /// Initializes a UIView.Options object.
        /// - Parameters:
        ///   - backgroundColor: The view’s background color.
        ///   - contentMode: A flag used to determine how a view lays out its content when its bounds change.
        ///   - cornerRadius: The view's corner radius
        ///   - clipsToBounds: A Boolean value that determines whether subviews are confined to the bounds of the view.
        ///   - isHidden: A Boolean value that determines whether the view is hidden.
        ///   - tintColor: The view's tint color.
        ///   - isUserInteractionEnabled: A Boolean value that determines whether user events are ignored and removed from the event queue.
        ///   - layoutCompression: Describes the view's layout compression and hugging priorities.
        ///   - alpha: The view’s alpha value.
        public init(
            backgroundColor: UIColor? = .clear,
            contentMode: UIView.ContentMode = .scaleToFill,
            cornerRadius: CGFloat = .zero,
            clipsToBounds: Bool = false,
            isHidden: Bool = false,
            tintColor: UIColor? = nil,
            isUserInteractionEnabled: Bool? = nil,
            alpha: CGFloat = 1.0,
            layoutCompression: LayoutCompressionOptions? = nil,
            layerOptions: CALayer.Options? = nil
        ) {
            self.backgroundColor          = backgroundColor
            self.contentMode              = contentMode
            self.cornerRadius             = cornerRadius
            self.clipsToBounds            = clipsToBounds
            self.isHidden                 = isHidden
            self.tintColor                = tintColor
            self.isUserInteractionEnabled = isUserInteractionEnabled
            self.alpha                    = alpha
            self.layoutCompression        = layoutCompression
            self.layerOptions             = layerOptions
        }
    }
}

public extension UIView.Options {
    
    static func layoutCompression(_ layoutCompression: UIView.LayoutCompressionOptions) -> UIView.Options {
        UIView.Options(layoutCompression: layoutCompression)
    }
    
    static func layerOptions(_ layerOptions: CALayer.Options) -> UIView.Options {
        UIView.Options(layerOptions: layerOptions)
    }
    
}
