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
    let colors : [UIColor] = [.blue, .orange, .yellow, .green, .purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dragables.append(dragable0)
        dragables.append(dragable1)
        dragables.append(dragable2)
        dragables.append(dragable3)
        dragables.append(dragable4)
        
        var i = 0
        
        for dragable in dragables{
            dragable.isUserInteractionEnabled = true
            
            dragable.backgroundColor = colors[i]
            dragable.alpha = 0.5
            i+=1
        }
        
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let touchPosistion = touch.location(in: self.view)
            
            for dragable in dragables{
                
                if dragable.frame.contains(touchPosistion){
                    
                    UIView.animate(withDuration: 0.1) {
                        
                        dragable.center = touchPosistion
                    }
                }
            }
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
