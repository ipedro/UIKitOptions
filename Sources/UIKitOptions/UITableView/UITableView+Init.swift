//
//  UITableView+Init.swift
//  UIKitOptions
//
//  Created by Pedro on 17.04.21.
//

import UIKit

public extension UITableView {
    // must specify style at creation. -initWithFrame: calls this with UITableViewStylePlain
    convenience init(_ style: UITableView.Style = .plain, _ options: Option...) {
        self.init(frame: .zero, style: style)
        
        apply(tableViewOptions: options)
    }
}
