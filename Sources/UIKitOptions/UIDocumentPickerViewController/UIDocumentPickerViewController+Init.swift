//
//  UIDocumentPickerViewController+Init.swift
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
    
    /// Initializes the picker instance for opening a document from a remote location.
    static func forOpening(_ options: Option...) -> UIDocumentPickerViewController {
        guard let documentTypeOptions = options.documentTypeOptions else {
            fatalError("Please provide document types using `.documentTypes()`")
        }
        
        let viewController: UIDocumentPickerViewController = {
            if #available(iOS 14.0, *) {
                #if swift(>=5.3)
                return UIDocumentPickerViewController(forOpeningContentTypes: documentTypeOptions.uttypes, asCopy: options.asCopy)
                #endif
            } else {
                return UIDocumentPickerViewController(documentTypes: documentTypeOptions.rawValues, in: .open)
            }
        }()
        
        viewController.apply(documentPickerOptions: options)
        
        return viewController
    }
    
    /// Initializes the picker instance for importing a document from a remote location.
    static func forImporting(_ options: Option...) -> UIDocumentPickerViewController {
        guard let documentTypeOptions = options.documentTypeOptions else {
            fatalError("Please provide document types using `.documentTypes()`")
        }
        
        let viewController: UIDocumentPickerViewController = {
            if #available(iOS 14.0, *) {
                #if swift(>=5.3)
                return UIDocumentPickerViewController(forOpeningContentTypes: documentTypeOptions.uttypes, asCopy: options.asCopy)
                #endif
            } else {
                return UIDocumentPickerViewController(documentTypes: documentTypeOptions.rawValues, in: .import)
            }
        }()
        
        viewController.apply(documentPickerOptions: options)
        
        return viewController
    }
    
    /// Initializes the picker for exporting local files to an external location. The new locations will be returned using `didPickDocumentAtURLs:`.
    static func forExporting(_ options: Option...) -> UIDocumentPickerViewController {
        guard let urls = options.urls else {
            fatalError("Please provide urls using `.urls()`")
        }
        
        let viewController: UIDocumentPickerViewController = {
            if #available(iOS 14.0, *) {
                #if swift(>=5.3)
                return UIDocumentPickerViewController(forExporting: urls, asCopy: options.asCopy)
                #endif
            } else {
                return UIDocumentPickerViewController(urls: urls, in: .exportToService)
            }
        }()
        
        viewController.apply(documentPickerOptions: options)
        
        return viewController
    }
    
    /// Initializes the picker for moving local files to an external location. The new locations will be returned using `didPickDocumentAtURLs:`.
    static func forMoving(_ options: Option...) -> UIDocumentPickerViewController {
        guard let urls = options.urls else {
            fatalError("Please provide urls using `.urls()`")
        }
        
        let viewController: UIDocumentPickerViewController = {
            if #available(iOS 14.0, *) {
                #if swift(>=5.3)
                return UIDocumentPickerViewController(forExporting: urls, asCopy: false)
                #endif
            } else {
                return UIDocumentPickerViewController(urls: urls, in: .moveToService)
            }
        }()
        
        viewController.apply(documentPickerOptions: options)
        
        return viewController
    }
    
}

extension UIDocumentPickerViewController.Option {
    private var documentTypeOptions: UTTTypeOptions? {
        guard case let .documentTypes(typeOptions) = self else {
            return nil
        }
        return typeOptions
    }
}

private extension Collection where Element == UIDocumentPickerViewController.Option {
    @available(iOS 14.0, *)
    var asCopy: Bool {
        for option in self {
            if case let .asCopy(copy) = option {
                return copy
            }
        }
        return false
    }
    
    var documentTypeOptions: UTTTypeOptions? {
        var array = UTTTypeOptions()
        
        forEach { element in
            guard case let .documentTypes(typeOptions) = element else {
                return
            }
            
            typeOptions.forEach { typeOption in
                
                guard array.contains(typeOption) == false else {
                    return
                }
                
                array.append(typeOption)
            }
        }
        
        return array.isEmpty ? nil : array
    }
    
    @available(iOS 14.0, *)
    var uttypes: [UTType]? {
        documentTypeOptions?.uttypes
    }
    
    var urls: [URL]? {
        for option in self {
            if case let .urls(urls) = option {
                return urls
            }
        }
        return nil
    }
}
