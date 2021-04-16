//
//  CALayer+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension CALayer {
    /// Applies the appearance options to the layer instance.
    /// - Parameter options: The layer appearance options.
    func applyOptions(_ options: Options) {
        self.anchorPoint        = options.anchorPoint
        self.borderWidth        = options.borderWidth
        self.borderColor        = options.borderColor?.cgColor
        self.backgroundColor    = options.backgroundColor?.cgColor
        self.cornerRadius       = options.cornerRadius
        self.masksToBounds      = options.masksToBounds
        self.maskedCorners      = options.maskedCorners
        self.shadowOffset       = options.shadowOffset
        self.shadowColor        = options.shadowColor?.cgColor
        self.shadowRadius       = options.shadowRadius
        self.shadowOpacity      = options.shadowOpacity
        self.shadowPath         = options.shadowPath
        self.isOpaque           = options.isOpaque
        self.opacity            = options.opacity
        self.shouldRasterize    = options.shouldRasterize
        self.rasterizationScale = options.rasterizationScale
    }
    
    /// Describes the layer's appearance.
    struct Options: Equatable {
        /// Defines the anchor point of the layer's bounds rectangle. Animatable.
        public var anchorPoint: CGPoint
        
        /// The width of the layer’s border. Animatable.
        public var borderWidth: CGFloat
        
        /// The color of the layer’s border. Animatable.
        public var borderColor: UIColor?
        
        ///The background color of the receiver. Animatable.
        public var backgroundColor: UIColor?
        
        /// The radius to use when drawing rounded corners for the layer’s background. Animatable.
        public var cornerRadius: CGFloat
        
        /// A Boolean indicating whether sublayers are clipped to the layer’s bounds. Animatable.
        public var masksToBounds: Bool
        
        /// Defines which of the four corners receives the masking when using `cornerRadius' property. Defaults to all four corners.
        public var maskedCorners: CACornerMask
        
        /// The offset (in points) of the layer’s shadow. Animatable.
        public var shadowOffset: CGSize
        
        /// The color of the layer’s shadow. Animatable.
        public var shadowColor: UIColor?
        
        /// The blur radius (in points) used to render the layer’s shadow. Animatable.
        public var shadowRadius: CGFloat
        
        /// The opacity of the layer’s shadow. Animatable.
        public var shadowOpacity: Float
        
        /// The shape of the layer’s shadow. Animatable.
        public var shadowPath: CGPath?
        
        /// A Boolean value indicating whether the layer contains completely opaque content.
        public var isOpaque: Bool
        
        /// The opacity of the receiver. Animatable.
        public var opacity: Float
        
        /// A Boolean that indicates whether the layer is rendered as a bitmap before compositing. Animatable
        public var shouldRasterize: Bool
        
        /// The scale at which to rasterize content, relative to the coordinate space of the layer. Animatable
        public var rasterizationScale: CGFloat
        
        public init(
            anchorPoint: CGPoint = Default.anchorPoint,
            borderWidth: CGFloat = Default.borderWidth,
            borderColor: UIColor? = Default.borderColor,
            backgroundColor: UIColor? = Default.backgroundColor,
            cornerRadius: CGFloat = Default.cornerRadius,
            masksToBounds: Bool = Default.masksToBounds,
            maskedCorners: CACornerMask = Default.maskedCorners,
            shadowOffset: CGSize = Default.shadowOffset,
            shadowColor: UIColor? = Default.shadowColor,
            shadowRadius: CGFloat = Default.shadowRadius,
            shadowOpacity: Float = Default.shadowOpacity,
            shadowPath: CGPath? = Default.shadowPath,
            isOpaque: Bool = Default.isOpaque,
            opacity: Float = Default.opacity,
            shouldRasterize: Bool = Default.shouldRasterize,
            rasterizationScale: CGFloat = Default.rasterizationScale
        ) {
            self.anchorPoint        = anchorPoint
            self.borderWidth        = borderWidth
            self.borderColor        = borderColor
            self.backgroundColor    = backgroundColor
            self.cornerRadius       = cornerRadius
            self.masksToBounds      = masksToBounds
            self.maskedCorners      = maskedCorners
            self.shadowOffset       = shadowOffset
            self.shadowColor        = shadowColor
            self.shadowRadius       = shadowRadius
            self.shadowOpacity      = shadowOpacity
            self.shadowPath         = shadowPath
            self.isOpaque           = isOpaque
            self.opacity            = opacity
            self.shouldRasterize    = shouldRasterize
            self.rasterizationScale = rasterizationScale
        }
    }
}

// MARK: - Convenience

public extension CALayer.Options {
    
    static var Default = CALayer.Options(
        anchorPoint: CGPoint(x: 0.5, y: 0.5),
        borderWidth: .zero,
        borderColor: nil,
        backgroundColor: nil,
        cornerRadius: .zero,
        masksToBounds: false,
        maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
        shadowOffset: CGSize(width: 0, height: -3),
        shadowColor: nil,
        shadowRadius: .zero,
        shadowOpacity: 1,
        shadowPath: nil,
        isOpaque: true,
        opacity: 1.0,
        shouldRasterize: false,
        rasterizationScale: .zero
    )
    
    static func shadow(
        offset: CGSize = CALayer.Options.Default.shadowOffset,
        color: UIColor? = UIColor.black,
        radius: CGFloat = CALayer.Options.Default.shadowRadius,
        opacity: Float = CALayer.Options.Default.shadowOpacity,
        path: CGPath? = CALayer.Options.Default.shadowPath
    ) -> CALayer.Options {
        CALayer.Options(
            shadowOffset: offset,
            shadowColor: color,
            shadowRadius: radius,
            shadowOpacity: opacity,
            shadowPath: path
        )
    }
    
    static func cornerRadius(_ cornerRadius: CGFloat, masksToBounds: Bool = true) -> CALayer.Options {
        CALayer.Options(
            cornerRadius: cornerRadius,
            masksToBounds: masksToBounds
        )
    }
    
    static func border(width: CGFloat, color: UIColor) -> CALayer.Options {
        CALayer.Options(
            borderWidth: width,
            borderColor: color
        )
    }
}
