//
//  UIFont+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIFont {
    static func preferredFont(
        forTextStyle textStyle: TextStyle,
        with symbolicTraits: UIFontDescriptor.SymbolicTraits,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIFont {
        UIFont.preferredFont(forTextStyle: textStyle, compatibleWith: traitCollection).withTraits(symbolicTraits)
    }
    
    func bold() -> UIFont {
        withTraits(.traitBold)
    }

    func italic() -> UIFont {
        withTraits(.traitItalic)
    }
    
    func monoSpace() -> UIFont {
        withTraits(.traitMonoSpace)
    }
}

private extension UIFont {
    func withTraits(_ symbolicTraits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(symbolicTraits) else {
            assertionFailure("Could not resolve the specified symbolic traits: \(symbolicTraits)")
            return self
        }
        
        //size `zero` means keep the size as it is
        return UIFont(descriptor: descriptor, size: .zero)
    }
}
