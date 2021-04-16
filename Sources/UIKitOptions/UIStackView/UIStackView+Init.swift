//
//  UIStackView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIStackView {
    convenience init(_ options: Option...) {
        self.init()
        
        isLayoutMarginsRelativeArrangement = true
        apply(stackViewOptions: options)
    }
    
//    static func vertical(
//        arrangedSubviews: [UIView] = [],
//        spacing: CGFloat = .zero,
//        layoutMargins: NSDirectionalEdgeInsets = .zero,
//        alignment: VerticalAlignment = .fill,
//        distribution: UIStackView.Distribution = .fill
//    ) -> UIStackView {
//        UIStackView(
//            arrangedSubviews: arrangedSubviews,
//            options:
//                .axis(.vertical),
//                .spacing(spacing),
//                .layoutMargins(layoutMargins),
//                .alignment(alignment.rawValue),
//                .distribution(distribution)
//        )
//    }
//
//    static func horizontal(
//        arrangedSubviews: [UIView] = [],
//        spacing: CGFloat = .zero,
//        layoutMargins: NSDirectionalEdgeInsets = .zero,
//        alignment: HorizontalAlignment = .fill,
//        distribution: UIStackView.Distribution = .fill
//    ) -> UIStackView {
//        UIStackView(
//            arrangedSubviews: arrangedSubviews,
//            options:
//                .axis(.horizontal),
//                .spacing(spacing),
//                .layoutMargins(layoutMargins),
//                .alignment(alignment.rawValue),
//                .distribution(distribution)
//        )
//    }
}
