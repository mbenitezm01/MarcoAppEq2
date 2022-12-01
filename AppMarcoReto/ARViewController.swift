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
import FocusEntity

class ARViewController: UIViewController, ARSessionDelegate, ARCoachingOverlayViewDelegate {
                
    var modelName:String = ""
            
    var placeMode:Bool = true
    
    var focusArr:[FocusEntity] = []
    
    func setMode(mode:Bool){
        placeMode = mode
        if placeMode == true{
            focusArr[0].isEnabled = true
        }
        else { focusArr[0].isEnabled = false }
    }
    
    public func updateModelName(name:String){
        modelName = name
    }
    
    private var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arView = ARView(frame: view.bounds)
        view.addSubview(arView)
        let focusSquare = FocusEntity(on: self.arView, focus: .classic)
        focusArr.append(focusSquare)
        
        // Set debug options
        //#if DEBUG
        //arView.debugOptions = [.showFeaturePoints, .showAnchorOrigins, .showAnchorGeometry]
        //#endif

    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        
        
        arView.session.run(config)
        arView.session.delegate = self
        
        placeModel(modelName: modelName)
        
    }
    
    
     
     
    func placeModel(modelName:String) {
        guard let model = try? Entity.load(named: modelName) else { return }
        model.name = "model"
        
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(model)
        
        arView.scene.addAnchor(anchor)
        
        print("place model")
        
    }
     
    
    func moveModel(transform: simd_float4x4) {
        
        guard let model = arView.scene.findEntity(named: "model") else { return }
        
        model.move(to: transform, relativeTo: nil)
        
        
    }
    
    
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.arView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer?) {
        
        print("tap")
        
        let results = self.arView.raycast(from: self.arView.center, allowing: .existingPlaneGeometry, alignment: .horizontal)
        if let firstResult = results.first {
            
            if placeMode {
                print("move model")
                moveModel(transform: firstResult.worldTransform)
            }
            
        }
    }
        
        
    
    override func viewDidAppear(_ animated: Bool) {
        addTapGesture()
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
        //focusSquare.isEnabled = false
        print("didRemove")
    }
}
