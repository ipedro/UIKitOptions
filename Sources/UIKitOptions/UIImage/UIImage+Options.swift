//
//  UIImage+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

extension UIImage {
    
    func withOptions(_ options: UIImage.Options) -> UIImage {
        var newImage: UIImage
        
        #if swift(>=5.0)
        if #available(iOS 13.0, *) {
            if let tintColor = options.tintColor {
                newImage = withTintColor(tintColor, renderingMode: options.renderingMode)
            }
            else {
                newImage = withRenderingMode(options.renderingMode)
            }
        }
        else {
            // Fallback on earlier versions
            newImage = withRenderingMode(options.renderingMode)
        }
        #else
        copy = withRenderingMode(options.renderingMode)
        #endif
        
        if let size = options.size {
            newImage = newImage.resized(size)
        }
        
        return newImage
    }
    
    struct Options: Equatable {
        public var renderingMode: RenderingMode
        
        #if swift(>=5.0)
        public var tintColor: UIColor?
        #endif
        
        public var size: CGSize?
        
        #if swift(>=5.0)
        public init(
            renderingMode: RenderingMode = .automatic,
            tintColor: UIColor? = nil,
            size: CGSize? =  nil
        ) {
            self.renderingMode = renderingMode
            self.tintColor     = tintColor
            self.size          = size
        }
        #else
        public init(
            renderingMode: RenderingMode = .automatic,
            size: CGSize? =  nil
        ) {
            self.renderingMode = renderingMode
            self.size          = size
        }
        #endif
    }
}
