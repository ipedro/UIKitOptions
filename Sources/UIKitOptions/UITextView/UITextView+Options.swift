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
    func applyOptions(_ options: UITextView.Options) {
        self.textAlignment      = options.alignment
        self.isEditable         = options.isEditable
        self.isScrollEnabled    = options.isScrollEnabled
        self.textContainerInset = options.textContainerInset
        self.dataDetectorTypes  = options.dataDetectorTypes
        self.clearsOnInsertion  = options.clearsOnInsertion
        
        if let font = options.font {
            self.font = font
        }
        if let textColor = options.textColor {
            self.textColor = textColor
        }
        
        if let viewOptions = options.viewOptions {
            applyOptions(viewOptions)
        }
    }
    
    /// An object that defines the appearance of a text view.
    struct Options {
        /// The font of the text.
        public var font: UIFont?
        
        /// The color of the text.
        public var textColor: UIColor?
        
        /// The technique for aligning the text.
        public var alignment: NSTextAlignment
        
        /// A Boolean value that indicates whether the text view is editable.
        public var isEditable: Bool
        
        /// A Boolean value that determines whether scrolling is enabled.
        public var isScrollEnabled: Bool
        
        /// The inset of the text container's layout area within the text view's content area.
        public var textContainerInset: UIEdgeInsets
        
        /// A Boolean value that indicates whether inserting text replaces the previous contents.
        public var clearsOnInsertion: Bool
        
        /// The types of data that convert to tappable URLs in the text view.
        public var dataDetectorTypes: UIDataDetectorTypes
        
        /// The appearance options of the view.
        public var viewOptions: UIView.Options?
        
        /// Initializes a text view configurator object.
        /// - Parameters:
        ///   - font: The font of the text.
        ///   - textColor: The color of the text.
        ///   - alignment: The technique for aligning the text.
        ///   - isEditable: A Boolean value that indicates whether the text view is editable.
        ///   - isScrollEnabled: A Boolean value that determines whether scrolling is enabled.
        ///   - dataDetectorTypes: The types of data that convert to tappable URLs in the text view.
        ///   - textContainerInset: The inset of the text container's layout area within the text view's content area.
        ///   - clearsOnInsertion: A Boolean value that indicates whether inserting text replaces the previous contents.

        public init(
            font: UIFont? = nil,
            textColor: UIColor? = nil,
            alignment: NSTextAlignment = .natural,
            isEditable: Bool = false,
            isScrollEnabled: Bool = false,
            textContainerInset: UIEdgeInsets = .zero,
            clearsOnInsertion: Bool = false,
            dataDetectorTypes: UIDataDetectorTypes = [],
            viewOptions: UIView.Options? = nil
        ) {
            self.font               = font
            self.textColor          = textColor
            self.alignment          = alignment
            self.isEditable         = isEditable
            self.isScrollEnabled    = isScrollEnabled
            self.textContainerInset = textContainerInset
            self.clearsOnInsertion  = clearsOnInsertion
            self.dataDetectorTypes  = dataDetectorTypes
            self.viewOptions        = viewOptions
        }
        
        /// Initializes a text view configurator object.
        /// - Parameters:
        ///   - fontStyle: Constants that describe the preferred styles for fonts.
        ///   - fontTraits: Constants that describe the stylistic aspects of a font.
        ///   - textColor: The color of the text.
        ///   - alignment: The technique for aligning the text.
        ///   - isEditable: A Boolean value that indicates whether the text view is editable.
        ///   - isScrollEnabled: A Boolean value that determines whether scrolling is enabled.
        ///   - dataDetectorTypes: The types of data that convert to tappable URLs in the text view.
        public init(
            fontStyle: UIFont.TextStyle = .body,
            fontTraits: UIFontDescriptor.SymbolicTraits,
            textColor: UIColor? = nil,
            alignment: NSTextAlignment = .natural,
            isEditable: Bool = false,
            isScrollEnabled: Bool = false,
            textContainerInset: UIEdgeInsets = .zero,
            clearsOnInsertion: Bool = false,
            dataDetectorTypes: UIDataDetectorTypes = [],
            viewOptions: UIView.Options? = nil
        ) {
            self.font = .preferredFont(forTextStyle: fontStyle, with: fontTraits)
            self.textColor = textColor
            self.alignment = alignment
            self.isEditable = isEditable
            self.isScrollEnabled    = isScrollEnabled
            self.textContainerInset = textContainerInset
            self.clearsOnInsertion  = clearsOnInsertion
            self.dataDetectorTypes  = dataDetectorTypes
            self.viewOptions        = viewOptions
        }
    }
}
