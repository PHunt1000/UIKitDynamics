//
//  ViewController.swift
//  UIKitDynamics
//
//  Created by student8 on 4/24/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {

    var dynamicAnimator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        setUpViews()
    }

    func setUpViews()
    {
        let blueSquare = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        blueSquare.backgroundColor = UIColor.blue
        view.addSubview(blueSquare)
        
        let redSquare = UIView(frame: CGRect(x: 300, y: 300, width: 50, height: 50))
        redSquare.backgroundColor = UIColor.red
        view.addSubview(redSquare)
        
        addDynamicAnimations(array: [blueSquare, redSquare])
    }
    
    func addDynamicAnimations(array: [UIView])
    
    {
        
        let myViewDynamicBehavior = UIDynamicItemBehavior(items: array)

        myViewDynamicBehavior.density = 1
        myViewDynamicBehavior.friction = 0
        myViewDynamicBehavior.elasticity = 1
        myViewDynamicBehavior.resistance = 0
        dynamicAnimator.addBehavior(myViewDynamicBehavior)
        let pushBehavior = UIPushBehavior(items: array, mode: .instantaneous)
        pushBehavior.magnitude = 1
        pushBehavior.pushDirection = CGVector(dx: 0.5, dy: 0.5)
        dynamicAnimator.addBehavior(pushBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: array)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)
        
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        print("A ball colided with another at \(p)")
        
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        print("A ball colided with a boundry at \(p)")

    }
    
}

