//
//  UIImage+Resize.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import AVFoundation
import UIKit

public extension UIImage {
    
    func resized(_ newSize: CGSize) -> UIImage {
        let aspectRect = AVMakeRect(
            aspectRatio: size,
            insideRect: CGRect(
                origin: .zero,
                size: newSize
            )
        )
        
        let renderer = UIGraphicsImageRenderer(size: aspectRect.size)
        
        return renderer.image { _ in
            draw(in: CGRect(origin: .zero, size: aspectRect.size))
        }.withRenderingMode(renderingMode)
        
    }
    
}
