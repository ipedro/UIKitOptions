//
//  UITableView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 17.04.21.
//

import UIKit

public extension UITableView {
    convenience init(_ options: Option...) {
        self.init(frame: .zero, style: options.style)
        apply(tableViewOptions: options)
    }
}

// MARK: - Convenience

extension Collection where Element == UITableView.Option {
    var style: UITableView.Style {
        for option in self {
            guard case let .style(style) = option else {
                continue
            }
            
            return style
        }
        
        return .plain
    }
}
