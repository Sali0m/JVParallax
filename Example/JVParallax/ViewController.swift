//
//  ViewController.swift
//  JVParallax
//
//  Created by Jehan Vossen on 20/02/2016.
//  Copyright © 2016 Tapptic. All rights reserved.
//

import UIKit
import JVParallax

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var parallaxView: JVParallaxView!
    @IBOutlet weak var parallaxViewLeading: NSLayoutConstraint!
    @IBOutlet weak var parallaxViewTrailing: NSLayoutConstraint!

    @IBOutlet var parallaxBehavior: JVScrollViewParallaxBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scrollView.backgroundColor = UIColor.red
        
        self.parallaxViewLeading.constant = self.view.frame.width-20
        self.parallaxViewTrailing.constant = self.view.frame.width-20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.parallaxBehavior.scrollViewDidScroll(scrollView)
    }
}
