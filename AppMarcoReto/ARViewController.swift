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

    var modelName:String = ""

    public func updateModelName(name:String){
        modelName = name
    }

    private var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arView = ARView(frame: view.bounds)
        view.addSubview(arView)

        // Set debug options
        #if DEBUG
        arView.debugOptions = [.showFeaturePoints, .showAnchorOrigins, .showAnchorGeometry]
        #endif

    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)

        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]


        arView.session.run(config)
        arView.session.delegate = self

        //placeModel()



    }

    /*


    func placeModel() {
        guard let model = try? Entity.load(named: "model") else { return }
        model.name = "model"

        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(model)

        arView.scene.addAnchor(anchor)

        print("place model")

    }
     */

    func moveModel(raycast: ARRaycastResult) {

        arView.scene.findEntity(named: "model")?.removeFromParent()

        guard let model = try? Entity.load(named: modelName) else { return }
        model.name = "model"


        let anchor = AnchorEntity(raycastResult: raycast)

        anchor.addChild(model)

        arView.scene.addAnchor(anchor)


    }


    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.arView.addGestureRecognizer(tap)
    }

    @objc func handleTap(recognizer: UITapGestureRecognizer?) {

        print("tap")

        let results = self.arView.raycast(from: self.arView.center, allowing: .existingPlaneGeometry, alignment: .horizontal)
        if let firstResult = results.first {

            print("move model")
            moveModel(raycast: firstResult)

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
        print("didRemove")
    }
}
