//
//  PulsingLayer.swift
//  himbo
//
//  Created by Marcus Kida on 30/11/2014.
//  Copyright (c) 2014 Marcus Kida. All rights reserved.
//

import UIKit
import QuartzCore


class PulsingLayer: CALayer {
    
    var radius: CGFloat {
        set(r) {
            self.setupRadius(r)
        }
        get {
            return self.cornerRadius
        }
    }
    
    var animationDuration: NSTimeInterval = 10.0
    var pulseInterval: NSTimeInterval = 3.0
    var pulseColor: UIColor = UIColor(red: 0.0, green: 0.478, blue: 1.0, alpha: 1.0)
    
    private var animationGroup: CAAnimationGroup!
    
    override init() {
        super.init()
        
        self.contentsScale = UIScreen.mainScreen().scale
        self.opacity = 0
        
        self.radius = 60.0
        self.backgroundColor = pulseColor.CGColor
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            self.setupAnimationGroup()
            if self.pulseInterval != Double.infinity {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.addAnimation(self.animationGroup, forKey: "pulse")
                })
            }
        })
    }

    convenience init(pulseColor: UIColor) {
        self.init()
        self.pulseColor = pulseColor
        self.backgroundColor = self.pulseColor.CGColor
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupRadius(radius: CGFloat) {
        
        let tempPos = self.position
        let diameter = radius * 2
        
        self.bounds = CGRectMake(0, 0, diameter, diameter)
        self.cornerRadius = radius
        self.position = tempPos
    }
    
    
    private func setupAnimationGroup() {
        let defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        self.animationGroup = CAAnimationGroup() as CAAnimationGroup
        self.animationGroup.duration = self.animationDuration + self.pulseInterval
        self.animationGroup.repeatCount = Float.infinity
        self.animationGroup.removedOnCompletion = false
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [scaleAnimation(), opacityAnimation()]
    }
    
    private func scaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 1.0
        scaleAnimation.duration = self.animationDuration
        return scaleAnimation
    }
    
    private func opacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = self.animationDuration
        opacityAnimation.values = [0.45, 0.45, 0]
        opacityAnimation.keyTimes = [0, 0.2, 1]
        opacityAnimation.removedOnCompletion = false
        return opacityAnimation;
    }
    
}