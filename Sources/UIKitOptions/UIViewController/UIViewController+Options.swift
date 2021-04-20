//
//  UIViewController+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 17.04.21.
//

import UIKit

public extension UIViewController {
    
    func apply(viewControllerOptions: Option...) {
        apply(viewControllerOptions: viewControllerOptions)
    }
    
    func apply(viewControllerOptions: Options) {
        viewControllerOptions.forEach { option in
            switch option {
            case let .definesPresentationContext(definesPresentationContext):
                self.definesPresentationContext = definesPresentationContext
                
            case let .providesPresentationContextTransitionStyle(providesPresentationContextTransitionStyle):
                self.providesPresentationContextTransitionStyle = providesPresentationContextTransitionStyle
                
            case let .restoresFocusAfterTransition(restoresFocusAfterTransition):
                self.restoresFocusAfterTransition = restoresFocusAfterTransition
                
            case let .modalTransitionStyle(modalTransitionStyle):
                self.modalTransitionStyle = modalTransitionStyle
                
            case let .modalPresentationStyle(modalPresentationStyle):
                self.modalPresentationStyle = modalPresentationStyle
                
            case let .modalPresentationCapturesStatusBarAppearance(modalPresentationCapturesStatusBarAppearance):
                self.modalPresentationCapturesStatusBarAppearance = modalPresentationCapturesStatusBarAppearance
                
            case let .edgesForExtendedLayout(edgesForExtendedLayout):
                self.edgesForExtendedLayout = edgesForExtendedLayout
                
            case let .extendedLayoutIncludesOpaqueBars(extendedLayoutIncludesOpaqueBars):
                self.extendedLayoutIncludesOpaqueBars = extendedLayoutIncludesOpaqueBars
                    
            case let .preferredContentSize(preferredContentSize):
                self.preferredContentSize = preferredContentSize
                
            case let .restorationIdentifier(restorationIdentifier):
                self.restorationIdentifier = restorationIdentifier
                
            case let .restorationClass(restorationClass):
                self.restorationClass = restorationClass
                
            case let .transitioningDelegate(transitioningDelegate):
                self.transitioningDelegate = transitioningDelegate
                
            case let .additionalSafeAreaInsets(additionalSafeAreaInsets):
                self.additionalSafeAreaInsets = additionalSafeAreaInsets
                
            case let .title(title):
                self.title = title
                
            case let .popoverPresentationControllerOptions(popoverPresentationControllerOptions):
                popoverPresentationController?.apply(popoverPresentationControllerOptions: popoverPresentationControllerOptions)
                
            case let .viewOptions(viewOptions):
                view.apply(viewOptions: viewOptions)
            
            case let .overrideUserInterfaceStyle(overrideUserInterfaceStyle):
                #if swift(>=5.0)
                if #available(iOS 13.0, *) {
                    self.overrideUserInterfaceStyle = overrideUserInterfaceStyle.rawValue
                }
                else {
                    print("overrideUserInterfaceStyle is unsupported in this iOS version. ignoring")
                }
                #endif
                
            case let .isModalInPresentation(isModalInPresentation):
                #if swift(>=5.0)
                if #available(iOS 13.0, *) {
                    self.isModalInPresentation = isModalInPresentation
                }
                else {
                    print("isModalInPresentation is unsupported in this iOS version. ignoring")
                }
                #endif
            }                
        }
    }
    
    typealias Options = [Option]
    
    enum Option {
        /// A localized string that represents the view this controller manages.
        case title(String?)
        
        /// A Boolean value that indicates whether this view controller's view is covered when the view controller or one of its descendants presents a view controller.
        case definesPresentationContext(Bool)
        
        /// A Boolean value that indicates whether the view controller specifies the transition style for view controllers it presents.
        case providesPresentationContextTransitionStyle(Bool)
        
        /// A Boolean value that indicates whether an item that previously was focused should again become focused when the item's view controller becomes visible and focusable.
        case restoresFocusAfterTransition(Bool)
        
        /// The transition style to use when presenting the view controller.
        case modalTransitionStyle(UIModalTransitionStyle)
        
        /// The presentation style for modally presented view controllers.
        case modalPresentationStyle(UIModalPresentationStyle)
        
        /// Specifies whether a view controller, presented non-fullscreen, takes over control of status bar appearance from the presenting view controller.
        case modalPresentationCapturesStatusBarAppearance(Bool)
        
        /// The edges that you extend for your view controller.
        case edgesForExtendedLayout(UIRectEdge)
        
        /// A Boolean value indicating whether or not the extended layout includes opaque bars.
        case extendedLayoutIncludesOpaqueBars(Bool)
        
        /// The preferred size for the view controller’s view.
        case preferredContentSize(CGSize)
        
        public enum UserInterfaceStyle {
            case unspecified, light, dark
            
            @available(iOS 12.0, *)
            var rawValue: UIUserInterfaceStyle {
                switch self {
                case .unspecified:
                    return .unspecified
                case .light:
                    return .light
                case .dark:
                    return .dark
                }
            }
        }
        /// The user interface style adopted by the view controller and all of its children.
        case overrideUserInterfaceStyle(UserInterfaceStyle)
        
        /// The identifier that determines whether the view controller supports state restoration.
        case restorationIdentifier(String?)
        
        /// The class responsible for recreating this view controller when restoring the app's state.
        case restorationClass(UIViewControllerRestoration.Type?)
        
        /// The delegate object that provides transition animator, interactive controller, and custom presentation controller objects.
        case transitioningDelegate(UIViewControllerTransitioningDelegate?)
        
        /// Custom insets that you specify to modify the view controller's safe area.
        case additionalSafeAreaInsets(UIEdgeInsets)
        
        /// A Boolean value indicating whether the view controller enforces a modal behavior.
        case isModalInPresentation(Bool)
        
        case popoverPresentationControllerOptions(UIPopoverPresentationController.Options)
        
        case viewOptions(UIView.Options)
        
        // MARK: - Convenience
        
        public static func viewOptions(_ options: UIView.Option...) -> Self {
            .viewOptions(options)
        }
        
        public static func popoverPresentationControllerOptions(_ options: UIPopoverPresentationController.Option...) -> Self {
            .popoverPresentationControllerOptions(options)
        }
    }
}
