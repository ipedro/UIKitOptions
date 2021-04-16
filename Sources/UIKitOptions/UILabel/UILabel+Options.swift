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
    func applyOptions(_ options: Options) {
        adjustsFontSizeToFitWidth            = options.adjustsFontSizeToFitWidth
        textAlignment                        = options.textAlignment
        minimumScaleFactor                   = options.minimumScaleFactor
        numberOfLines                        = options.numberOfLines
        allowsDefaultTighteningForTruncation = options.allowsDefaultTighteningForTruncation
        
        if let preferredMaxLayoutWidth = options.preferredMaxLayoutWidth {
            self.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        }
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
    
    /// An object that defines the appearance of a UILabel.
    struct Options: Equatable {
        /// The font of the text.
        public var font: UIFont?
        
        /// The color of the text.
        public var textColor: UIColor?
        
        /// The technique to use for aligning the text.
        public var textAlignment: NSTextAlignment
        
        /// The maximum number of lines to use for rendering text.
        public var numberOfLines: Int
        
        /// The minimum scale factor supported for the label’s text.
        public var minimumScaleFactor: CGFloat
        
        /// A Boolean value indicating whether the font size should be reduced in order to fit the title string into the label’s bounding rectangle.
        public var adjustsFontSizeToFitWidth: Bool
        
        /// A Boolean value that determines whether the label tightens text before truncating.
        public var allowsDefaultTighteningForTruncation: Bool
        
        /// The preferred maximum width, in points, for a multiline label.
        public var preferredMaxLayoutWidth: CGFloat?
        
        /// The appearance options of the view.
        public var viewOptions: UIView.Options?
        
        /// Initializes a UILabel.Options object.
        /// - Parameters:
        ///   - font: The font of the text.
        ///   - textColor: The color of the text.
        ///   - textAlignment: The technique to use for aligning the text.
        ///   - numberOfLines: The maximum number of lines to use for rendering text.
        ///   - minimumScaleFactor: The minimum scale factor supported for the label’s text.
        ///   - adjustsFontSizeToFitWidth: A Boolean value indicating whether the font size should be reduced in order to fit the title string into the label’s bounding rectangle.
        ///   - viewOptions: The appearance options of the view.
        ///   - preferredMaxLayoutWidth: The preferred maximum width, in points, for a multiline label.
        ///   - allowsDefaultTighteningForTruncation: A Boolean value that determines whether the label tightens text before truncating.
        public init(
            font: UIFont? = nil,
            textColor: UIColor? = nil,
            textAlignment: NSTextAlignment = .natural,
            numberOfLines: Int = 1,
            minimumScaleFactor: CGFloat = 0,
            adjustsFontSizeToFitWidth: Bool = false,
            allowsDefaultTighteningForTruncation: Bool = false,
            preferredMaxLayoutWidth: CGFloat? = nil,
            viewOptions: UIView.Options? = nil
        ) {
            self.font                                 = font
            self.textColor                            = textColor
            self.textAlignment                        = textAlignment
            self.minimumScaleFactor                   = minimumScaleFactor
            self.numberOfLines                        = numberOfLines
            self.adjustsFontSizeToFitWidth            = adjustsFontSizeToFitWidth
            self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
            self.preferredMaxLayoutWidth              = preferredMaxLayoutWidth
            self.viewOptions                          = viewOptions
        }
        
        /// Initializes a UILabel.Options object.
        /// - Parameters:
        ///   - fontStyle: Constants that describe the preferred styles for fonts.
        ///   - fontTraits: Constants that describe the stylistic aspects of a font.
        ///   - textColor: The color of the text.
        ///   - textAlignment: The technique to use for aligning the text.
        ///   - numberOfLines: The maximum number of lines to use for rendering text.
        ///   - minimumScaleFactor: The minimum scale factor supported for the label’s text.
        ///   - adjustsFontSizeToFitWidth: A Boolean value indicating whether the font size should be reduced in order to fit the title string into the label’s bounding rectangle.
        ///   - preferredMaxLayoutWidth: The preferred maximum width, in points, for a multiline label.
        ///   - viewOptions: The appearance options of the view.
        ///   - allowsDefaultTighteningForTruncation: A Boolean value that determines whether the label tightens text before truncating.
        public init(
            fontStyle: UIFont.TextStyle = .body,
            fontTraits: UIFontDescriptor.SymbolicTraits = [],
            textColor: UIColor? = nil,
            textAlignment: NSTextAlignment = .natural,
            numberOfLines: Int = 0,
            minimumScaleFactor: CGFloat = 0,
            adjustsFontSizeToFitWidth: Bool = false,
            allowsDefaultTighteningForTruncation: Bool = false,
            preferredMaxLayoutWidth: CGFloat? = nil,
            viewOptions: UIView.Options? = nil
        ) {
            self.font                                 = .preferredFont(forTextStyle: fontStyle, with: fontTraits)
            self.textColor                            = textColor
            self.textAlignment                        = textAlignment
            self.minimumScaleFactor                   = minimumScaleFactor
            self.numberOfLines                        = numberOfLines
            self.adjustsFontSizeToFitWidth            = adjustsFontSizeToFitWidth
            self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
            self.preferredMaxLayoutWidth              = preferredMaxLayoutWidth
            self.viewOptions                          = viewOptions
        }
    }
}
