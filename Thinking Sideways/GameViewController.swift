//
//  GameViewController.swift
//  Thinking Sideways
//
//  Created by James Pickar on 5/9/19.
//  Copyright © 2019 Project Steel. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        return .landscape
        
    }
    
}
