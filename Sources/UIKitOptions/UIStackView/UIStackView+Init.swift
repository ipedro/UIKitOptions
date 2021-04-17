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
        apply(stackViewOptions: options)
    }
    
    static func vertical(_ options: Option...) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.apply(stackViewOptions: options)
        
        return stackView
    }
    
    static func horizontal(_ options: Option...) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.apply(stackViewOptions: options)
        
        return stackView
    }
}
