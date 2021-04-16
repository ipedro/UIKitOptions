//
//  UITextView+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UITextView {
    /// Applies the appeareance options to the text view instance.
    /// - Parameter options: The text view appearance options.
    func applyOptions(_ options: Options...) {
        applyOptions(options)
    }
        
    /// Applies the appeareance options to the text view instance.
    /// - Parameter options: The text view appearance options.
    func applyOptions(_ options: [Options]) {
        options.forEach { option in
            switch option {
            case let .font(font):
                self.font = font
                
            case let .textColor(textColor):
                self.textColor = textColor
                
            case let .alignment(alignment):
                self.textAlignment = alignment
                
            case let .isEditable(isEditable):
                self.isEditable = isEditable
                
            case let .isScrollEnabled(isScrollEnabled):
                self.isScrollEnabled = isScrollEnabled
                
            case let .textContainerInset(textContainerInset):
                self.textContainerInset = textContainerInset
                
            case let .clearsOnInsertion(clearsOnInsertion):
                self.clearsOnInsertion = clearsOnInsertion
                
            case let .dataDetectorTypes(dataDetectorTypes):
                self.dataDetectorTypes = dataDetectorTypes
                
            case let .viewOptions(viewOptions):
                applyOptions(viewOptions)
                
            }
        }
    }
    
    /// An object that defines the appearance of a text view.
    enum Options {
        /// The font of the text.
        case font(UIFont)
        
        /// The color of the text.
        case textColor(UIColor)
        
        /// The technique for aligning the text.
        case alignment(NSTextAlignment)
        
        /// A Boolean value that indicates whether the text view is editable.
        case isEditable(Bool)
        
        /// A Boolean value that determines whether scrolling is enabled.
        case isScrollEnabled(Bool)
        
        /// The inset of the text container's layout area within the text view's content area.
        case textContainerInset(UIEdgeInsets)
        
        /// A Boolean value that indicates whether inserting text replaces the previous contents.
        case clearsOnInsertion(Bool)
        
        /// The types of data that convert to tappable URLs in the text view.
        case dataDetectorTypes(UIDataDetectorTypes)
        
        /// The appearance options of the view.
        case viewOptions(UIView.Options)
    }
}
