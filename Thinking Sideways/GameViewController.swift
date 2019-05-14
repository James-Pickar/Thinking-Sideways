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
    
    @IBOutlet weak var tintView: UIView!
    @IBOutlet weak var sceneView: SCNView!
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
    
    func setTint(color: UIColor!){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.tintView.backgroundColor = color
            }
        }
    }
    
    func ballIsInRange(minX : Float, maxX : Float, minZ : Float, maxZ : Float) -> Bool{
        let ballPosition = ballNode.presentation.position
        
        if ballPosition.x >= minX && ballPosition.x <= maxX && ballPosition.z >= minZ && ballPosition.z <= maxZ{
            return true
        }else{
            return false
        }
        
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
            self.motionForce = SCNVector3(y * 0.3, 0, (z + 0.2) * 0.3)
        }
        
         ballNode.physicsBody?.velocity += motionForce
        
        if ballIsInRange(minX: 10, maxX: 60, minZ: -60, maxZ: -50){
           
            self.setTint(color: .blue)
            
        }else if ballIsInRange(minX: 0, maxX: 70, minZ: -120, maxZ: -110){
            
            self.setTint(color: .orange)
            
        }else if ballIsInRange(minX: -110, maxX: -50, minZ: -220, maxZ: -210){
            self.setTint(color: .yellow)
        }else if ballPosition.z <= -295{
            
            self.scene.isPaused = true
            self.performSegue(withIdentifier: "toTest", sender: self)
        }else{
            
            self.setTint(color: .clear)
        }
    }
}
