//
//  ScrollViewParallaxBehavior.swift
//  JVParallax
//
//  Created by Jehan Vossen on 21/02/2016.
//  Copyright © 2016 Jehan Vossen. All rights reserved.
//

import UIKit

class JVScrollViewParallaxBehavior: NSObject, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView?
    
    @IBOutlet var parallaxViews: [JVParallaxView]?
    
    @IBInspectable var isHorizontal: Bool = true
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        guard let scrollView = self.scrollView else { print("You forgot to set the scrollView to your behavior"); return }
        guard let parallaxViews = self.parallaxViews else { return }
        
        for parallaxView in parallaxViews {
            guard let superView = parallaxView.superview else { return }
            
            let parallaxViewFramInScrollView = scrollView.convertRect(parallaxView.frame, fromView: superView)

            let visibleRect = CGRectMake(scrollView.contentOffset.x, scrollView.contentOffset.y, scrollView.frame.width * getWidthMultiplier(scrollView), scrollView.frame.height * getHeightMultiplier(scrollView))
            let intersectRect = CGRectIntersection(parallaxViewFramInScrollView, visibleRect)
            
            guard intersectRect != CGRectNull else { return }
            let sizeValue = isHorizontal ? parallaxViewFramInScrollView.width : parallaxViewFramInScrollView.height
            let originValue = isHorizontal ? parallaxViewFramInScrollView.origin.x : parallaxViewFramInScrollView.origin.y
            
            let intersectSizeValue = isHorizontal ? intersectRect.width : intersectRect.height
            let intersectOriginValue = isHorizontal ? intersectRect.origin.x : intersectRect.origin.y
            let percentageValueShowed = (intersectSizeValue/sizeValue)/2 + ((intersectOriginValue - originValue)/sizeValue)
            
            parallaxView.value = percentageValueShowed
        }
    }
    
    // MARK: - Calculation of size multipliers by taking account insets 
    
    private func getHeightMultiplier(scrollView : UIScrollView) -> CGFloat {
        return getMultiplier(scrollView.contentInset.top, offset: scrollView.contentOffset.y)
    }
    
    private func getWidthMultiplier(scrollView : UIScrollView) -> CGFloat {
        return getMultiplier(scrollView.contentInset.left, offset: scrollView.contentOffset.x)
    }
    
    private func getMultiplier(inset : CGFloat, offset : CGFloat) -> CGFloat {
        guard inset > 0 else { return 1 }
        var multiplier = ((inset + offset))/inset
        multiplier = multiplier > 1 ? 1 : multiplier
        return 1 - multiplier
    }
}
