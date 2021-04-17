//
//  UILabel+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UILabel {
    /// Applies the appearance options to the label instance.
    /// - Parameter options: The label appearance options.
    func apply(labelOptions: Option...) {
        apply(labelOptions: labelOptions)
    }
    
    /// Applies the appearance options to the label instance.
    /// - Parameter options: The label appearance options.
    func apply(labelOptions: Options) {
        labelOptions.forEach { option in
            switch option {
            case let .font(font):
                self.font = font
                
            case let .textColor(textColor):
                self.textColor = textColor
                
            case let .text(text):
                self.text = text
                
            case let .attributedText(attributedText):
                self.attributedText = attributedText
                                
            case let .textAlignment(textAlignment):
                self.textAlignment = textAlignment
                
            case let .numberOfLines(numberOfLines):
                self.numberOfLines = numberOfLines
                
            case let .minimumScaleFactor(minimumScaleFactor):
                self.minimumScaleFactor = minimumScaleFactor
                
            case let .adjustsFontSizeToFitWidth(adjustsFontSizeToFitWidth):
                self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
                
            case let .allowsDefaultTighteningForTruncation(allowsDefaultTighteningForTruncation):
                self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
                
            case let .preferredMaxLayoutWidth(preferredMaxLayoutWidth):
                self.preferredMaxLayoutWidth = preferredMaxLayoutWidth
            case let .viewOptions(viewOptions):
                apply(viewOptions: viewOptions)
            }
        }
    }
    
    typealias Options = [Option]
    
    /// An object that defines the appearance of a UILabel.
    enum Option {
        case text(String?)
        
        case attributedText(NSAttributedString?)
        
        /// The font of the text.
        case font(UIFont)
        
        /// The color of the text.
        case textColor(UIColor)
        
        /// The technique to use for aligning the text.
        case textAlignment(NSTextAlignment)
        
        /// The maximum number of lines to use for rendering text.
        case numberOfLines(Int)
        
        /// The minimum scale factor supported for the label’s text.
        case minimumScaleFactor(CGFloat)
        
        /// A Boolean value indicating whether the font size should be reduced in order to fit the title string into the label’s bounding rectangle.
        case adjustsFontSizeToFitWidth(Bool)
        
        /// A Boolean value that determines whether the label tightens text before truncating.
        case allowsDefaultTighteningForTruncation(Bool)
        
        /// The preferred maximum width, in points, for a multiline label.
        case preferredMaxLayoutWidth(CGFloat)
        
        /// The appearance options of the view.
        case viewOptions(UIView.Options)
        
        // MARK: - Convenience
        
        /// Constants that describe the preferred styles for fonts.
        public static func textStyle(_ style: UIFont.TextStyle, traits: UIFontDescriptor.SymbolicTraits = []) -> Self {
            .font(UIFont.preferredFont(forTextStyle: style, with: traits))
        }
        
        /// The appearance options of the view.
        public static func viewOptions(_ viewOptions: UIView.Option...) -> Self {
            .viewOptions(viewOptions)
        }
        
        /// Describes the layer's appearance.
        public static func layerOptions(_ layerOptions: CALayer.Option...) -> Self {
            .viewOptions(.layerOptions(layerOptions))
        }
        
        /// Describes the view's layout compression and hugging priorities.
        public static func layoutCompression(_ options: LayoutCompressionOption...) -> Self {
            .viewOptions(.layoutCompression(options))
        }
    }
}
