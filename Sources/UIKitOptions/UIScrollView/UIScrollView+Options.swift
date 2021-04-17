//
//  UIScrollView+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIScrollView {
    
    func apply(scrollViewOptions: Option...) {
        apply(scrollViewOptions: scrollViewOptions)
    }
        
    func apply(scrollViewOptions: Options) {
        scrollViewOptions.forEach { option in
            switch option {
            case let .contentInset(contentInset):
                self.contentInset = contentInset
                
            case let .isDirectionalLockEnabled(isDirectionalLockEnabled):
                self.isDirectionalLockEnabled = isDirectionalLockEnabled
                
            case let .bounces(bounces):
                self.bounces = bounces
                
            case let .alwaysBounceVertical(alwaysBounceVertical):
                self.alwaysBounceVertical = alwaysBounceVertical
                
            case let .alwaysBounceHorizontal(alwaysBounceHorizontal):
                self.alwaysBounceHorizontal = alwaysBounceHorizontal
                
            case let .isPagingEnabled(isPagingEnabled):
                self.isPagingEnabled = isPagingEnabled
                
            case let .isScrollEnabled(isScrollEnabled):
                self.isScrollEnabled = isScrollEnabled
                
            case let .showsVerticalScrollIndicator(showsVerticalScrollIndicator):
                self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
                
            case let .showsHorizontalScrollIndicator(showsHorizontalScrollIndicator):
                self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
                
            case let .indicatorStyle(indicatorStyle):
                self.indicatorStyle = indicatorStyle
                
            case let .decelerationRate(decelerationRate):
                self.decelerationRate = decelerationRate
                
            case let .keyboardDismissMode(keyboardDismissMode):
                self.keyboardDismissMode = keyboardDismissMode
                
            case let .scrollsToTop(scrollsToTop):
                self.scrollsToTop = scrollsToTop
                
            case let .viewOptions(viewOptions):
                apply(viewOptions: viewOptions)
            }
        }
    }
    
    typealias Options = [Option]
    
    enum Option {
        /// default UIEdgeInsetsZero. add additional scroll area around content
        case contentInset(UIEdgeInsets)
        
        /// default NO. if YES, try to lock vertical or horizontal scrolling while dragging
        case isDirectionalLockEnabled(Bool)

        /// default YES. if YES, bounces past edge of content and back again
        case bounces(Bool)

        /// default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag vertically
        case alwaysBounceVertical(Bool)

        /// default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag horizontally
        case alwaysBounceHorizontal(Bool)

        /// default NO. if YES, stop on multiples of view bounds
        case isPagingEnabled(Bool)

        /// default YES. turn off any dragging temporarily
        case isScrollEnabled(Bool)
        
        /// default YES. show indicator while we are tracking. fades out after tracking
        case showsVerticalScrollIndicator(Bool)

        /// default YES. show indicator while we are tracking. fades out after tracking
        case showsHorizontalScrollIndicator(Bool)

        /// default is UIScrollViewIndicatorStyleDefault
        case indicatorStyle(UIScrollView.IndicatorStyle)
        
        /// A floating-point value that determines the rate of deceleration after the user lifts their finger.
        case decelerationRate(UIScrollView.DecelerationRate)
        
        /// The manner in which the keyboard is dismissed when a drag begins in the scroll view.
        case keyboardDismissMode(UIScrollView.KeyboardDismissMode)
        
        /// A Boolean value that controls whether the scroll-to-top gesture is enabled. default is YES.
        case scrollsToTop(Bool)
        
        /// The appearance options of the view.
        case viewOptions(UIView.Options)
        
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
