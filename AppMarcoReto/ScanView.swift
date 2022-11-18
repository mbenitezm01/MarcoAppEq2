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
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                Color.clear
                    .frame(height: 0)
                    .background(Material.bar)
            }
            .ignoresSafeArea(.all, edges: .top)
    }
}

struct ARViewContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewContainer>) -> ARViewController{
        
        let viewController = ARViewController()
        return viewController
        
    }
    
    func updateUIViewController(_ uiViewController: ARViewController, context: UIViewControllerRepresentableContext<ARViewContainer>){
        
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
