//
//  ScanView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI
import ARKit
import RealityKit

struct ScanView: View {
    let modelName:String
    
    @State var toggleState = true
            
    var body: some View {
        ZStack{
            
            ARViewContainer(modelName: modelName, toggleState: toggleState).edgesIgnoringSafeArea(.all)
                .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                    Color.clear
                        .frame(height: 0)
                        .background(Material.bar)
                }
                .ignoresSafeArea(.all, edges: .top)
            VStack{
                Spacer()
                HStack{
                    Toggle("Mover Modelo", isOn: $toggleState)
                        .toggleStyle(.button)
                        .padding()
                    Spacer()
                }
            }
            
        }
    }
}

struct ARViewContainer: UIViewControllerRepresentable {
    let modelName:String
    let toggleState:Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewContainer>) -> ARViewController{
        
        let viewController = ARViewController()
        viewController.updateModelName(name: modelName)
        return viewController
        
    }
    
    func updateUIViewController(_ uiViewController: ARViewController, context: UIViewControllerRepresentableContext<ARViewContainer>){
        uiViewController.setMode(mode: toggleState)
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(modelName: "model")
    }
}
