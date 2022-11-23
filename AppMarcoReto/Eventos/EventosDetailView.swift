//
//  ExposDetailView.swift
//  AppMarcoReto
//
//  Created by Eduardo Pons on 23/11/22.
//


import SwiftUI

struct EventosDetailView: View {
    let evento:EventosModel
    var body: some View {
        ZStack{
            Color("ColorFondoMarco")
                .ignoresSafeArea()
            VStack{
                Image(evento.nombreImagen)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .clipShape(Rectangle())
                    .shadow(radius:7)
                    .offset(y:-50)
                
                Text(evento.nombreEvento)
                    .font(Font.custom("MarkPro-Book", size: 40))
                    .offset(y:-50)
                
                Text("Inicio: \(evento.fechaInicio)\nFin:    \(evento.fechaFin)\n")
                    .font(Font.custom("MarkPro-Book", size: 16))
                    .offset(y:-50)
                
                Text(evento.descripcion)
                    .font(Font.custom("MarkPro-Book", size: 20)
                        )
                    .padding(.horizontal, 20)
                    .offset(y:-30)
                    .multilineTextAlignment(.center)
                
            }// VStack
        }// ZStack
    }
}

struct EventosDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventosDetailView(evento:EventosModel.defaultEvento)
    }
}

