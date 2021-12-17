//
//  ViewController.swift
//  ARKitDemoApp
//
//  Created by Prateek on 15/12/21.
//

import UIKit
import ARKit

class ViewController: UIViewController
{

    @IBOutlet weak var arGiftBoxSceneView: ARSCNView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let configuration  = ARWorldTrackingConfiguration()
        arGiftBoxSceneView.session.run(configuration)
        
        addBox()
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(true)
        
        arGiftBoxSceneView.session.pause()
    }

    func addBox(){
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.white
        material.diffuse.contents = #imageLiteral(resourceName: "YML.png")
        box.materials = [material]
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.position = SCNVector3(0, 0, -0.2)
        let scene = SCNScene()
        scene.rootNode.addChildNode(boxNode)
        arGiftBoxSceneView.scene = scene
    }

}

