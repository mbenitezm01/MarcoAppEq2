//
//  ObrasItemView.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 08/11/22.
//

import SwiftUI

struct ObrasItemView: View {
    
    let obra:ObrasModel
    
    var body: some View {
        AsyncImage(url: URL(string: "http://10.14.255.68:10205/" + obra.nombreImagen[0])){phase in
            if let image = phase.image{
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width:120, height: 120)
                    .clipped()
                    .overlay(alignment: .topLeading, content: {
                        if obra.modelName != nil{
                            Text("3D")
                                .foregroundColor(Color("Rosa Marco"))
                        }
                })
            } else if phase.error != nil{
                Color.red
            } else {
                Color.blue
            }
        }
    }
}

struct ObrasItemView_Previews: PreviewProvider {
    static var previews: some View {
        ObrasItemView(obra:ObrasModel.defaultObra)
    }
}
