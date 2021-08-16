//
//  UIImage+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

extension UIImage {
    func withOptions(_ imageOptions: UIImage.Option...) -> UIImage {
        withOptions(imageOptions)
    }
    
    func withOptions(_ imageOptions: UIImage.Options) -> UIImage {
        var newImage = self
        
        imageOptions.forEach { option in
            switch option {
            case let .renderingMode(renderingMode):
                newImage = newImage.withRenderingMode(renderingMode)
                
            #if swift(>=5.0)
            case let .tintColor(tintColor, renderingMode):
                if #available(iOS 13.0, *) {
                    newImage = newImage.withTintColor(tintColor, renderingMode: renderingMode)
                }
            #endif
                
            case let .size(size):
                newImage = newImage.resized(size)
            }
        }
        
        return newImage
    }
    
    typealias Options = [Option]
    
    enum Option {
        /// The rendering mode controls how UIKit uses color information to display an image.
        case renderingMode(RenderingMode)
        
        #if swift(>=5.0)
        case tintColor(_ tintColor: UIColor, renderingMode: RenderingMode = .automatic)
        #endif

        case size(CGSize)
        
    }
}
