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
    
    var ballNode : SCNNode!
    var selfieStickNode : SCNNode!
    
    var motion = MotionHelper()
    var motionForce = SCNVector3(0, 0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        setupNodes()
        
    }
    
    func setupScene(){
        sceneView = self.view as? SCNView
        sceneView.delegate = self
        
        //sceneView.allowsCameraControl = true
        scene = SCNScene(named: "art.scnassets/Main.scn")
        sceneView.scene = scene
    }
    
    func setupNodes(){
        ballNode = scene.rootNode.childNode(withName: "ball", recursively: true)
        
        selfieStickNode = scene.rootNode.childNode(withName: "selfieStick", recursively: true)
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

extension GameViewController : SCNSceneRendererDelegate{
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        let ball = ballNode.presentation
        let ballPosition = ball.position
        
        let targetPosition = SCNVector3(ballPosition.x, ballPosition.y + 5, ballPosition.z + 5)
        var cameraPosition = selfieStickNode.position
        
        let camDamping : Float = 0.3
        
        let xComponant = cameraPosition.x * (1 - camDamping) + targetPosition.x * camDamping
        let yComponant = cameraPosition.y * (1 - camDamping) + targetPosition.y * camDamping
        let zComponant = cameraPosition.z * (1 - camDamping) + targetPosition.z * camDamping
        
        cameraPosition = SCNVector3(xComponant, yComponant, zComponant)
        
        selfieStickNode.position = cameraPosition
        
        motion.getAccelerometerData { (x, y, z) in
            self.motionForce = SCNVector3(x * 0.3, 0, (y + 0.4) * -0.3)
        }
        
         ballNode.physicsBody?.velocity += motionForce
    }
}
