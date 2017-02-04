//
//  ScrollViewParallaxBehavior.swift
//  JVParallax
//
//  Created by Jehan Vossen on 21/02/2016.
//  Copyright © 2016 Jehan Vossen. All rights reserved.
//

import UIKit

public class JVScrollViewParallaxBehavior: NSObject, UIScrollViewDelegate {
    
    @IBOutlet public var scrollView: UIScrollView?
    
    @IBOutlet public var parallaxViews: [JVParallaxView]?
    
    @IBInspectable public var isHorizontal: Bool = true
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let scrollView = self.scrollView else { print("You forgot to set the scrollView to your behavior"); return }
        guard let parallaxViews = self.parallaxViews else { return }
        
        for parallaxView in parallaxViews {
            guard let superView = parallaxView.superview else { return }
            
            let parallaxViewFramInScrollView = scrollView.convert(parallaxView.frame, from: superView)

            let visibleRect = CGRect(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y, width: scrollView.frame.width * getWidthMultiplier(scrollView), height: scrollView.frame.height * getHeightMultiplier(scrollView))
            let intersectRect = parallaxViewFramInScrollView.intersection(visibleRect)
            
            guard intersectRect != CGRect.null else { return }
            let sizeValue = isHorizontal ? parallaxViewFramInScrollView.width : parallaxViewFramInScrollView.height
            let originValue = isHorizontal ? parallaxViewFramInScrollView.origin.x : parallaxViewFramInScrollView.origin.y
            
            let intersectSizeValue = isHorizontal ? intersectRect.width : intersectRect.height
            let intersectOriginValue = isHorizontal ? intersectRect.origin.x : intersectRect.origin.y
            let percentageValueShowed = (intersectSizeValue/sizeValue)/2 + ((intersectOriginValue - originValue)/sizeValue)
            
            parallaxView.value = percentageValueShowed
        }
    }
    
    // MARK: - Calculation of size multipliers by taking account insets 
    
    fileprivate func getHeightMultiplier(_ scrollView : UIScrollView) -> CGFloat {
        return getMultiplier(scrollView.contentInset.top, offset: scrollView.contentOffset.y)
    }
    
    fileprivate func getWidthMultiplier(_ scrollView : UIScrollView) -> CGFloat {
        return getMultiplier(scrollView.contentInset.left, offset: scrollView.contentOffset.x)
    }
    
    fileprivate func getMultiplier(_ inset : CGFloat, offset : CGFloat) -> CGFloat {
        guard inset > 0 else { return 1 }
        var multiplier = ((inset + offset))/inset
        multiplier = multiplier > 1 ? 1 : multiplier
        return 1 - multiplier
    }
}
