//
//  QuizViewController.swift
//  Thinking Sideways
//
//  Created by James Pickar on 5/14/19.
//  Copyright © 2019 Project Steel. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var dragable0: UIView!
    @IBOutlet weak var dragable1: UIView!
    @IBOutlet weak var dragable2: UIView!
    @IBOutlet weak var dragable3: UIView!
    @IBOutlet weak var dragable4: UIView!
    
    
    @IBOutlet weak var place0: UIView!
    @IBOutlet weak var place1: UIView!
    @IBOutlet weak var place2: UIView!
    @IBOutlet weak var place3: UIView!
    @IBOutlet weak var place4: UIView!
    
    var dragables : [UIView] = []
    var placeables : [UIView : UIView] = [:]
    let colors : [UIColor] = [.blue, .orange, .yellow, .orange, .green, .purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dragables.append(dragable0)
        dragables.append(dragable1)
        dragables.append(dragable2)
        dragables.append(dragable3)
        dragables.append(dragable4)
        
        for dragable in dragables{
            dragable.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(recognizer:)))
            panGesture.minimumNumberOfTouches = 1
            dragable.addGestureRecognizer(panGesture)
            
        }
        
    }
    
    @objc func panGesture(recognizer:UIPanGestureRecognizer){
        
        if let dragView = recognizer.view{
            
            self.view.bringSubviewToFront(dragView)
            let translation = recognizer.translation(in: self.view)
            dragView.center = CGPoint(x: dragView.center.x + translation.x, y: dragView.center.y + translation.y)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
            let center = dragView.center
            dragView.center = center
        
           /*
            let constraintRight = NSLayoutConstraint(item: dragView, attribute: .centerX, relatedBy: .equal, toItem: dragView.superview, attribute: .right, multiplier: 1, constant: dragView.center.x - UIScreen.main.fixedCoordinateSpace.bounds.width)
             let constraintTop = NSLayoutConstraint(item: dragView, attribute: .centerY, relatedBy: .equal, toItem: dragView.superview, attribute: .top, multiplier: 1, constant: dragView.center.y - UIScreen.main.fixedCoordinateSpace.bounds.height)
            
            var constraitsToRemove : [NSLayoutConstraint] = []
            
            for constrait in dragView.constraints{
                if constrait.firstAttribute != .width && constrait.secondAttribute != .width && constrait.firstAttribute != .height && constrait.secondAttribute != .height{
                    constraitsToRemove.append(constrait)
                }
            }
            
            dragView.removeConstraints(constraitsToRemove)
            dragView.addConstraint(constraintRight)
            dragView.addConstraint(constraintTop)
            */
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
