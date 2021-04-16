//
//  UIStackView+Subviews.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(addArrangedSubview)
    }
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview)
    }
    
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func replaceArrangedSubviews(with arrangedSubviews: [UIView]) {
        removeAllArrangedSubviews()
        addArrangedSubviews(arrangedSubviews)
    }
}
