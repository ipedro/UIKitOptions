//
//  UIColorPickerViewController+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 18.04.21.
//

import UIKit

#if swift(>=5.3)
@available(iOS 14.0, *)
public extension UIColorPickerViewController {
    
    func apply(colorPickerOptions: Option...) {
        apply(colorPickerOptions: colorPickerOptions)
    }
    
    func apply(colorPickerOptions: Options) {
        colorPickerOptions.forEach { option in
            switch option {
            case let .colorPickerDelegate(delegate):
                self.delegate = delegate
                
            case let .selectedColor(selectedColor):
                self.selectedColor = selectedColor
                
            case let .supportsAlpha(supportsAlpha):
                self.supportsAlpha = supportsAlpha
                
            case let .viewControllerOptions(viewControllerOptions):
                self.apply(viewControllerOptions: viewControllerOptions)
                
            case let .popoverPresentationControllerOptions(popoverPresentationControllerOptions):
                popoverPresentationController?.apply(popoverPresentationControllerOptions: popoverPresentationControllerOptions)
            }
        }
    }
    
    typealias Options = [Option]
    
    enum Option {
        /// A view controller that handles the delegate actions.
        case colorPickerDelegate(UIColorPickerViewControllerDelegate?)
        
        /// The color selected by the user.
        case selectedColor(UIColor)
        
        /// A Boolean value that enables alpha value control.
        case supportsAlpha(Bool)
        
        case viewControllerOptions(UIViewController.Options)
        
        case popoverPresentationControllerOptions(UIPopoverPresentationController.Options)
        
        // MARK: - Convenience
        
        public static func viewOptions(_ options: UIView.Option...) -> Self {
            .viewControllerOptions(.viewOptions(options))
        }
        
        public static func viewControllerOptions(_ options: UIViewController.Option...) -> Self {
            .viewControllerOptions(options)
        }
        
        public static func popoverPresentationControllerOptions(_ options: UIPopoverPresentationController.Option...) -> Self {
            .popoverPresentationControllerOptions(options)
        }
    }
}
#endif
