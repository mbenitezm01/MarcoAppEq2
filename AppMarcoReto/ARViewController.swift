//
//  ARViewController.swift
//  RealityApp
//
//  Created by Alumno on 11/11/22.
//

import UIKit
import ARKit
import RealityKit
import SwiftUI
import Combine

class ARViewController: UIViewController, ARSessionDelegate, ARCoachingOverlayViewDelegate {
    
    private var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arView = ARView(frame: view.bounds)
        view.addSubview(arView)
        
        let image = arView.session.currentFrame?.capturedImage
        let qrDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        
        
        arView.session.run(config)
        arView.session.delegate = self
        
        placeModel()
        
    }
    
    
    func placeModel() {
        guard let gramophone = try? Entity.load(named: "gramophone") else { return }
        
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(gramophone)
        
        arView.scene.addAnchor(anchor)
        
        for animation in gramophone.availableAnimations {
            gramophone.playAnimation(animation.repeat())
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    

}

extension ARViewController {
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]){
        print("didAdd")
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]){
        //print("didUpdate")
    }
    
    func session(_ session: ARSession, didRemove anchors: [ARAnchor]){
        print("didRemove")
    }
}
