//
//  UITextView+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UITextView {
    /// Applies the appeareance options to the text view instance.
    /// - Parameter textViewOptions: The text view appearance options.
    func apply(textViewOptions: Option...) {
        apply(textViewOptions: textViewOptions)
    }
        
    /// Applies the appeareance options to the text view instance.
    /// - Parameter textViewOptions: The text view appearance options.
    func apply(textViewOptions: Options) {
        textViewOptions.forEach { option in
            switch option {
            case let .font(font):
                self.font = font
                
            case let .textStyle(textStyle, traits):
                self.font = .preferredFont(forTextStyle: textStyle, with: traits)
                
            case let .textColor(textColor):
                self.textColor = textColor
                
            case let .alignment(alignment):
                self.textAlignment = alignment
                
            case let .isEditable(isEditable):
                self.isEditable = isEditable
                
            case let .textContainerInset(textContainerInset):
                self.textContainerInset = textContainerInset
                
            case let .clearsOnInsertion(clearsOnInsertion):
                self.clearsOnInsertion = clearsOnInsertion
                
            case let .dataDetectorTypes(dataDetectorTypes):
                self.dataDetectorTypes = dataDetectorTypes
                
            case let .text(text):
                self.text = text
                
            case let .attributedText(attributedText):
                self.attributedText = attributedText
                                
            case let .viewOptions(viewOptions):
                apply(viewOptions: viewOptions)
                
            case let .scrollViewOptions(scrollViewOptions):
                apply(scrollViewOptions: scrollViewOptions)
            }
        }
    }
    
    typealias Options = [Option]
    
    /// An object that defines the appearance of a text view.
    enum Option {
        /// The text that the text view displays.
        case text(String?)
        
        /// The styled text that the text view displays.
        case attributedText(NSAttributedString?)
        
        /// The font of the text.
        case font(UIFont?)
        
        /// Constants that describe the preferred styles for fonts.
        case textStyle(_ style: UIFont.TextStyle, traits: UIFontDescriptor.SymbolicTraits = [])
        
        /// The color of the text.
        case textColor(UIColor)
        
        /// The technique for aligning the text.
        case alignment(NSTextAlignment)
        
        /// A Boolean value that indicates whether the text view is editable.
        case isEditable(Bool)
        
        /// The inset of the text container's layout area within the text view's content area.
        case textContainerInset(UIEdgeInsets)
        
        /// A Boolean value that indicates whether inserting text replaces the previous contents.
        case clearsOnInsertion(Bool)
        
        /// The types of data that convert to tappable URLs in the text view.
        case dataDetectorTypes(UIDataDetectorTypes)
        
        /// The appearance options of the view.
        case viewOptions(UIView.Options)
        
        /// The options of the scroll view.
        case scrollViewOptions(UIScrollView.Options)
        
        /// The options of the scroll view.
        public static func scrollViewOptions(_ scrollViewOptions: UIScrollView.Option...) -> Self {
            .scrollViewOptions(scrollViewOptions)
        }
        
        /// The base appearance options of the text view.
        public static func viewOptions(_ viewOptions: UIView.Option...) -> Self {
            .viewOptions(viewOptions)
        }
        
        /// Describes the text view layer's appearance.
        public static func layerOptions(_ layerOptions: CALayer.Option...) -> Self {
            .viewOptions(.layerOptions(layerOptions))
        }
        
        /// Describes the text view's layout compression and hugging priorities.
        public static func layoutCompression(_ options: LayoutCompressionOption...) -> Self {
            .viewOptions(.layoutCompression(options))
        }
    }
}
