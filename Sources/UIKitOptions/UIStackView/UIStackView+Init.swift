//
//  UIStackView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIStackView {
    convenience init(arrangedSubviews: [UIView], options: Options) {
        self.init()
        
        addArrangedSubviews(arrangedSubviews)
        
        applyOptions(options)
    }
    
    static func vertical(
        arrangedSubviews: [UIView] = [],
        spacing: CGFloat = .zero,
        layoutMargins: NSDirectionalEdgeInsets = .zero,
        alignment: VerticalAlignment = .fill,
        distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        UIStackView(
            arrangedSubviews: arrangedSubviews,
            options: .verticalAxis(
                spacing: spacing,
                layoutMargins: layoutMargins,
                alignment: alignment,
                distribution: distribution
            )
        )
    }
    
    static func horizontal(
        arrangedSubviews: [UIView] = [],
        spacing: CGFloat = .zero,
        layoutMargins: NSDirectionalEdgeInsets = .zero,
        alignment: HorizontalAlignment = .fill,
        distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        UIStackView(
            arrangedSubviews: arrangedSubviews,
            options: .horizontalAxis(
                spacing: spacing,
                layoutMargins: layoutMargins,
                alignment: alignment,
                distribution: distribution
            )
        )
    }
}
