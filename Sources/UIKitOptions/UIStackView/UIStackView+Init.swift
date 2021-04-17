//
//  UIStackView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIStackView {
    static func vertical(_ options: VerticalOption...) -> UIStackView {
        UIStackView.vertical(options)
    }
    
    static func vertical(_ options: VerticalOptions) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.apply(stackViewOptions: options)
        
        return stackView
    }
    
    static func horizontal(_ options: HorizontalOption...) -> UIStackView {
        UIStackView.horizontal(options)
    }
    
    static func horizontal(_ options: HorizontalOptions) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.apply(stackViewOptions: options)
        
        return stackView
    }
}
