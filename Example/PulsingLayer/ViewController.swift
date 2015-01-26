//
//  ViewController.swift
//  PulsingLayer
//
//  Created by Marcus Kida on 26/01/2015.
//  Copyright (c) 2015 Marcus Kida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layer = PulsingLayer(pulseColor: UIColor.redColor())
        layer.animationDuration = 0.8
        layer.pulseInterval = 0.3
        layer.position = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame)/2)
        self.view.layer.addSublayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

