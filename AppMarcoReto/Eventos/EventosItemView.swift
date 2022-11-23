//
//  ExposItemView.swift
//  AppMarcoReto
//
//  Created by Eduardo Pons on 23/11/22.
//

import SwiftUI

struct EventosItemView: View {
    let evento:EventosModel
    var body: some View {
        Image(evento.nombreImagen)
            .resizable()
            .scaledToFit()
            .frame(width:160)
            .overlay(alignment: .topLeading, content: {
                Text(evento.nombreEvento)
                    .font(.custom("MarkPro-Book", size: 20))
                    .foregroundColor(.white)
                    //.stroke(color.black)
                    .padding()
                    
            })
            .overlay(alignment: .bottomTrailing, content: {
                Text("Hasta: \(evento.fechaFin)")
                    .font(.custom("MarkPro-Book", size: 15))
                    .foregroundColor(.white)
                    //.stroke(color.black)
                    .padding()
            })
    }
}

struct EventosItemView_Previews: PreviewProvider {
    static var previews: some View {
        EventosItemView(evento:EventosModel.defaultEvento)
    }
}
