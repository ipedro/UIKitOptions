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
    func applyOptions(_ options: Options...) {
        applyOptions(options)
    }
    
    /// Applies the appearance options to the view instance.
    /// - Parameter options: The view appearance options.
    func applyOptions(_ options: [Options]) {
        options.forEach { option in
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
                
            case let .layoutCompression(layoutCompressionOptions):
                self.applyOptions(layoutCompressionOptions)
                
            case let .layerOptions(layerOptions):
                layer.applyOptions(layerOptions)
                
            case let .isUserInteractionEnabled(isUserInteractionEnabled):
                self.isUserInteractionEnabled = isUserInteractionEnabled
                
            }
        }
    }
    
    /// An object that defines the appearance of a view.
    enum Options: Equatable {
        /// The view’s background color.
        case backgroundColor(UIColor)
        
        /// A flag used to determine how a view lays out its content when its bounds change.
        case contentMode(UIView.ContentMode)
        
        /// A Boolean value that determines whether subviews are confined to the bounds of the view.
        case clipsToBounds(Bool)
        
        /// A Boolean value that determines whether the view is hidden.
        case isHidden(Bool)
        
        /// The view's tint color.
        case tintColor(UIColor)
        
        /// The view’s alpha value.
        case alpha(CGFloat)
        
        /// Describes the view's layout compression and hugging priorities.
        case layoutCompression(LayoutCompressionOptions)
        
        /// /// Describes the layer's appearance.
        case layerOptions(CALayer.Options)
        
        /// A Boolean value that determines whether user events are ignored and removed from the event queue.
        case isUserInteractionEnabled(Bool)
    }
}
