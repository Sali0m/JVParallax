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
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        guard let scrollView = self.scrollView else { print("You forgot to set the scrollView to your behavior"); return }
        guard let parallaxViews = self.parallaxViews else { return }
        
        for parallaxView in parallaxViews {
            guard let superView = parallaxView.superview else { return }
            
            let parallaxViewFramInScrollView = scrollView.convertRect(parallaxView.frame, fromView: superView)
            let visibleRect = CGRectMake(scrollView.contentOffset.x, scrollView.contentOffset.y, scrollView.frame.width, scrollView.frame.height)
            let intersectRect = CGRectIntersection(parallaxViewFramInScrollView, visibleRect)
            
            guard intersectRect != CGRectNull else { return }
            let percentageValueShowed = (intersectRect.width/parallaxViewFramInScrollView.width)/2 + ((intersectRect.origin.x - parallaxViewFramInScrollView.origin.x)/parallaxViewFramInScrollView.width)
            
            parallaxView.value = percentageValueShowed
        }
    }
}
