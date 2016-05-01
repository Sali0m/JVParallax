//
//  JVParallaxView.swift
//  JVParallax
//
//  Created by Jehan Vossen on 20/02/2016.
//  Copyright © 2016 Tapptic. All rights reserved.
//

import UIKit

@IBDesignable class JVParallaxView: UIView {
    
    //MARK: - Interface builder vars
    @IBOutlet var viewToParallax: UIView? {
        didSet {
            self.updateForView()
        }
    }
    
    /** This value is to determine a ratio at which the viewToParallax is out of bounds of this view.
     The value is from 0 to 1 and represent a percentage of this view width|height */
    @IBInspectable var maxParallax: CGFloat = 0.25 {
        didSet {
            self.updateStartPoint()
        }
    }
    
    /** This is the value in pourcentage of the advancement of the parallax.
     Value between 0 to 1. 0 means the viewToParallax will be to the left|top of this view, a value of 0.5 means it is centered in this view and a value of 1 means it will be to the right|bottom of this view. */
    @IBInspectable var value: CGFloat = 0.0 {
        didSet {
            self.updateValue()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            self.updateStartPoint()
            self.updateValue()
        }
    }
    
    //MARK: - Private vars
    private var centerXConstraint: NSLayoutConstraint!
    private var centerYConstraint: NSLayoutConstraint!
    private var startPoint: CGFloat! {
        didSet {
            self.updateValue()
        }
    }
    
    //MARK: - life cycle
    func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    init() {
        super.init(frame: CGRectZero)
        self.initialize()
    }
    
    //MARK: - Pivate func
    private func updateForView() {
        guard let viewToParallax = self.viewToParallax else { return }
        
        viewToParallax.removeFromSuperview()
        
        let width = NSLayoutConstraint(item: viewToParallax, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: viewToParallax, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1, constant: 0)
        self.centerXConstraint = NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: viewToParallax, attribute: .CenterX, multiplier: 1, constant: 0)
        self.centerYConstraint = NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: viewToParallax, attribute: .CenterY, multiplier: 1, constant: 0)
        
        viewToParallax.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(viewToParallax)
        
        NSLayoutConstraint.activateConstraints([width, height, self.centerXConstraint, self.centerYConstraint])
        self.layoutIfNeeded()
        
        self.updateStartPoint()
    }
    
    private func updateStartPoint() {
        
        if self.isHorizontal {
            self.startPoint = self.frame.width * self.maxParallax
        } else {
            self.startPoint = self.frame.height * self.maxParallax
        }
    }
    
    private func updateValue() {
        guard let startPoint = self.startPoint else { return }
        let newConstant = (startPoint) - ((self.value*2) * startPoint)
        
        if self.isHorizontal {
            self.centerXConstraint?.constant = newConstant
            self.centerYConstraint?.constant = 0
        } else {
            self.centerXConstraint?.constant = 0
            self.centerYConstraint?.constant = newConstant
        }
    }
}
