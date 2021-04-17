//
//  UIView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIView {
    convenience init(_ options: Option...) {
        self.init(options)
    }
    
    convenience init(_ options: Options) {
        self.init(frame: .zero)
        apply(viewOptions: options)
    }
    
    convenience init(_ layoutCompressionOptions: LayoutCompressionOption...) {
        self.init(layoutCompressionOptions)
    }
    
    convenience init(_ layoutCompressionOptions: LayoutCompressionOptions) {
        self.init(frame: .zero)
        apply(layoutCompressionOptions: layoutCompressionOptions)
    }
    
    convenience init(_ layerOptions: CALayer.Option...) {
        self.init(layerOptions)
    }
    
    convenience init(_ layerOptions: CALayer.Options) {
        self.init(frame: .zero)
        layer.apply(layerOptions: layerOptions)
    }
}
