//
//  UIScrollView+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

public extension UIScrollView {
    
    func applyOptions(_ options: Options) {
        self.contentInset                   = options.contentInset
        self.isDirectionalLockEnabled       = options.isDirectionalLockEnabled
        self.bounces                        = options.bounces
        self.alwaysBounceVertical           = options.alwaysBounceVertical
        self.alwaysBounceHorizontal         = options.alwaysBounceHorizontal
        self.isPagingEnabled                = options.isPagingEnabled
        self.isScrollEnabled                = options.isScrollEnabled
        self.showsVerticalScrollIndicator   = options.showsVerticalScrollIndicator
        self.showsHorizontalScrollIndicator = options.showsHorizontalScrollIndicator
        self.indicatorStyle                 = options.indicatorStyle
        self.decelerationRate               = options.decelerationRate
        self.keyboardDismissMode            = options.keyboardDismissMode
        self.scrollsToTop                   = options.scrollsToTop
    }
    
    struct Options: Equatable {
        /// default UIEdgeInsetsZero. add additional scroll area around content
        public var contentInset: UIEdgeInsets
        
        /// default NO. if YES, try to lock vertical or horizontal scrolling while dragging
        public var isDirectionalLockEnabled: Bool

        /// default YES. if YES, bounces past edge of content and back again
        public var bounces: Bool

        /// default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag vertically
        public var alwaysBounceVertical: Bool

        /// default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag horizontally
        public var alwaysBounceHorizontal: Bool

        /// default NO. if YES, stop on multiples of view bounds
        public var isPagingEnabled: Bool

        /// default YES. turn off any dragging temporarily
        public var isScrollEnabled: Bool
        
        /// default YES. show indicator while we are tracking. fades out after tracking
        public var showsVerticalScrollIndicator: Bool

        /// default YES. show indicator while we are tracking. fades out after tracking
        public var showsHorizontalScrollIndicator: Bool

        /// default is UIScrollViewIndicatorStyleDefault
        public var indicatorStyle: UIScrollView.IndicatorStyle
        
        /// A floating-point value that determines the rate of deceleration after the user lifts their finger.
        public var decelerationRate: UIScrollView.DecelerationRate
        
        /// The manner in which the keyboard is dismissed when a drag begins in the scroll view.
        public var keyboardDismissMode: UIScrollView.KeyboardDismissMode
        
        /// A Boolean value that controls whether the scroll-to-top gesture is enabled. default is YES.
        var scrollsToTop: Bool
        
        public init(
            contentInset: UIEdgeInsets = .zero,
            isDirectionalLockEnabled: Bool = false,
            bounces: Bool = true,
            alwaysBounceVertical: Bool = false,
            alwaysBounceHorizontal: Bool = false,
            isPagingEnabled: Bool = false,
            isScrollEnabled: Bool = true,
            showsVerticalScrollIndicator: Bool = true,
            showsHorizontalScrollIndicator: Bool = true,
            indicatorStyle: UIScrollView.IndicatorStyle = .default,
            decelerationRate: UIScrollView.DecelerationRate = .normal,
            keyboardDismissMode: UIScrollView.KeyboardDismissMode = .none,
            scrollsToTop: Bool = true
        ) {
            self.contentInset                   = contentInset
            self.isDirectionalLockEnabled       = isDirectionalLockEnabled
            self.bounces                        = bounces
            self.alwaysBounceVertical           = alwaysBounceVertical
            self.alwaysBounceHorizontal         = alwaysBounceHorizontal
            self.isPagingEnabled                = isPagingEnabled
            self.isScrollEnabled                = isScrollEnabled
            self.showsVerticalScrollIndicator   = showsVerticalScrollIndicator
            self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
            self.indicatorStyle                 = indicatorStyle
            self.decelerationRate               = decelerationRate
            self.keyboardDismissMode            = keyboardDismissMode
            self.scrollsToTop                   = scrollsToTop
        }
    }
}
