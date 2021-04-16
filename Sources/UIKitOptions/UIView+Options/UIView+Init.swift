//
//  UIView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIView {
    convenience init(frame: CGRect = .zero, options: UIView.Options) {
        self.init(frame: frame)
        
        applyOptions(options)
    }
    
    convenience init(
        frame: CGRect = .zero,
        backgroundColor: UIColor? = nil,
        contentMode: UIView.ContentMode = .scaleToFill,
        cornerRadius: CGFloat = .zero,
        clipsToBounds: Bool = false,
        isHidden: Bool = false,
        tintColor: UIColor? = nil,
        isUserInteractionEnabled: Bool? = nil,
        layoutCompression: LayoutCompressionOptions? = nil
    ) {
        self.init(frame: frame)
        
        applyOptions(
            Options(
                backgroundColor: backgroundColor,
                contentMode: contentMode,
                cornerRadius: cornerRadius,
                clipsToBounds: clipsToBounds,
                isHidden: isHidden,
                tintColor: tintColor,
                isUserInteractionEnabled: isUserInteractionEnabled,
                layoutCompression: layoutCompression
            )
        )
    }
}
