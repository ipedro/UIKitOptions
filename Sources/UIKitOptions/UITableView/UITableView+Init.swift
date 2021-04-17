//
//  UITableView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 17.04.21.
//

import UIKit

public extension UITableView {
    convenience init(_ style: UITableView.Style = .plain, _ options: Option...) {
        self.init(style, options)
    }
    
    convenience init(_ style: UITableView.Style = .plain, _ options: Options) {
        self.init(frame: .zero, style: style)
        apply(tableViewOptions: options)
    }
}
