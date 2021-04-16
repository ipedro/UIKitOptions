//
//  UIImageView+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIImageView {
    
    func apply(imageViewOptions: Options) {
        imageViewOptions.forEach { option in
            switch option {
            case let .image(image):
                self.image = image
                
            case let .highlightedImage(highlightedImage):
                self.highlightedImage = highlightedImage
                
            case let .isHighlighted(isHighlighted):
                self.isHighlighted = isHighlighted
                
            case let .highlightedAnimationImages(highlightedAnimationImages):
                self.highlightedAnimationImages = highlightedAnimationImages
                
            case let .animationImages(animationImages):
                self.animationImages = animationImages
                
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
                
            case let .animationRepeatCount(animationRepeatCount):
                self.animationRepeatCount = animationRepeatCount
                
            case let .viewOptions(viewOptions):
                apply(viewOptions: viewOptions)
                
            }
        }
    }

    typealias Options = [Option]
    
    enum Option: Equatable {
        case image(UIImage?)
        case highlightedImage(UIImage?)
        case isHighlighted(Bool)
        case highlightedAnimationImages([UIImage]?)
        case animationImages([UIImage]?)
        case animationDuration(TimeInterval)
        case animationRepeatCount(Int)
        
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
