//
//  ExposItemView.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 15/11/22.
//

import SwiftUI

struct ExposItemView: View {
    let expo:ExposModel
    var body: some View {
        Image(expo.nombreImagen)
            .resizable()
            .scaledToFit()
            .frame(width:240)
            .overlay(alignment: .topLeading, content: {
                Text(expo.titulo)
                    .font(.custom("MarkPro-Book", size: 20))
                    .foregroundColor(.white)
                    //.stroke(color.black)
                    .padding()
                    
            })
            .overlay(alignment: .bottomTrailing, content: {
                Text("Hasta: \(expo.fechaFin)")
                    .font(.custom("MarkPro-Book", size: 15))
                    .foregroundColor(.white)
                    //.stroke(color.black)
                    .padding()
            })
    }
}

struct ExposItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExposItemView(expo:ExposModel.defaultExpo)
    }
}
