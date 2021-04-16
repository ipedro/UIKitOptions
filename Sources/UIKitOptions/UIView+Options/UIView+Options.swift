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
        
        if let layoutCompressionOptions = options.layoutCompression {
            self.applyOptions(layoutCompressionOptions)
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
        
        /// Describes the view's layout compression and hugging priorities.
        public var layoutCompression: LayoutCompressionOptions?
        
        /// Initializes a UIView.Options object.
        /// - Parameters:
        ///   - backgroundColor: The view’s background color.
        ///   - contentMode: A flag used to determine how a view lays out its content when its bounds change.
        ///   - cornerRadius: The view's corner radius
        ///   - clipsToBounds: A Boolean value that determines whether subviews are confined to the bounds of the view.
        ///   - isHidden: A Boolean value that determines whether the view is hidden.
        ///   - tintColor: The view's tint color.
        ///   - layoutCompression: Describes the view's layout compression and hugging priorities.
        public init(
            backgroundColor: UIColor? = nil,
            contentMode: UIView.ContentMode = .scaleToFill,
            cornerRadius: CGFloat = .zero,
            clipsToBounds: Bool = false,
            isHidden: Bool = false,
            tintColor: UIColor? = nil,
            layoutCompression: LayoutCompressionOptions? = nil
        ) {
            self.backgroundColor   = backgroundColor
            self.contentMode       = contentMode
            self.cornerRadius      = cornerRadius
            self.clipsToBounds     = clipsToBounds
            self.isHidden          = isHidden
            self.tintColor         = tintColor
            self.layoutCompression = layoutCompression
        }
    }
}
