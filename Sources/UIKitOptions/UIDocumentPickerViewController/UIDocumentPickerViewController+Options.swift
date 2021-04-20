//
//  UIDocumentPickerViewController+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 18.04.21.
//

import UIKit
import MobileCoreServices
#if swift(>=5.3)
import UniformTypeIdentifiers
#endif

public extension UIDocumentPickerViewController {
    
    func apply(documentPickerOptions: Option...) {
        apply(documentPickerOptions: documentPickerOptions)
    }
    
    func apply(documentPickerOptions: Options) {
        documentPickerOptions.forEach { option in
            switch option {
            case let .documentPickerDelegate(delegate):
                self.delegate = delegate
                
            case let .allowsMultipleSelection(allowsMultipleSelection):
                self.allowsMultipleSelection = allowsMultipleSelection
                
            case let .viewControllerOptions(viewControllerOptions):
                apply(viewControllerOptions: viewControllerOptions)
                
            case let .popoverPresentationControllerOptions(popoverPresentationControllerOptions):
                popoverPresentationController?.apply(popoverPresentationControllerOptions: popoverPresentationControllerOptions)
                
            case let .shouldShowFileExtensions(shouldShowFileExtensions):
                #if swift(>=5.0)
                if #available(iOS 13.0, *) {
                    self.shouldShowFileExtensions = shouldShowFileExtensions
                }
                #endif
                
            case let .directoryURL(directoryURL):
                #if swift(>=5.0)
                if #available(iOS 13.0, *) {
                    self.directoryURL = directoryURL
                }
                #endif
            
            // cases used on init only
            case .asCopy,
                 .documentTypes,
                 .urls:
                break
            }
        }
    }
    
    typealias Options = [Option]
    
    enum Option {
        case documentTypes(UTTTypeOptions)
        
        /// If true, the picker will give you access to a local copy of the document, otherwise you will have access to the original document.
        case asCopy(Bool)
        
        /// A Boolean value that determines whether the browser always shows file extensions.
        case shouldShowFileExtensions(Bool)
        
        case directoryURL(URL?)
        
        /// An object that adheres to the UIDocumentPickerDelegate protocol.
        case documentPickerDelegate(UIDocumentPickerDelegate?)
        
        /// A Boolean value that determines whether the user can select more than one document at a time.
        case allowsMultipleSelection(Bool)
        
        case urls([URL])
        
        case viewControllerOptions(UIViewController.Options)
        
        // MARK: - Convenience
        
        public static func viewOptions(_ options: UIView.Option...) -> Self {
            .viewControllerOptions(.viewOptions(options))
        }
        
        public static func urls(_ urls: URL...) -> Self {
            .urls(urls)
        }

        public static func viewControllerOptions(_ options: UIViewController.Option...) -> Self {
            .viewControllerOptions(options)
        }
        
        case popoverPresentationControllerOptions(UIPopoverPresentationController.Options)
        
        public static func popoverPresentationControllerOptions(_ options: UIPopoverPresentationController.Option...) -> Self {
            .popoverPresentationControllerOptions(options)
        }

        public static func documentTypes(_ options: UTTTypeOption...) -> Self {
            .documentTypes(options)
        }
        
    }
}
