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
    
    var sceneView : SCNView!
    var scene : SCNScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        
    }
    
    func setupScene(){
        sceneView = self.view as? SCNView
        sceneView.allowsCameraControl = true
        scene = SCNScene(named: "art.scnassets/Main.scn")
        sceneView.scene = scene
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
