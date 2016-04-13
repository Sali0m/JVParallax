//
//  ViewController.swift
//  JVParallax
//
//  Created by Jehan Vossen on 20/02/2016.
//  Copyright © 2016 Tapptic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var parallaxView: JVParallaxView!
    @IBOutlet weak var parallaxViewLeading: NSLayoutConstraint!

    @IBOutlet var parallaxBehavior: JVScrollViewParallaxBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.scrollView.backgroundColor = UIColor.redColor()
        self.scrollView.contentSize = CGSize(width: self.view.frame.width*10, height: self.view.frame.height)
        self.parallaxViewLeading.constant = 1024
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.parallaxBehavior.scrollViewDidScroll(scrollView)
    }
}