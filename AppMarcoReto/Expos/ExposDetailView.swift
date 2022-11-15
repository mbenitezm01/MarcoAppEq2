//
//  ExposDetailView.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 15/11/22.
//

import SwiftUI

struct ExposDetailView: View {
    let expo:ExposModel
    var body: some View {
        ZStack{
            Color("ColorFondoMarco")
                .ignoresSafeArea()
            VStack{
                Image(expo.nombreImagen)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .clipShape(Rectangle())
                    .shadow(radius:7)
                    .offset(y:-50)
                
                Text(expo.titulo)
                    .font(Font.custom("MarkPro-Book", size: 40))
                    .offset(y:-50)
                
                Text("Inicio: \(expo.fechaInicio)\nFin:    \(expo.fechaFin)\n")
                    .font(Font.custom("MarkPro-Book", size: 16))
                    .offset(y:-50)
                
                Text(expo.descripcion)
                    .font(Font.custom("MarkPro-Book", size: 20)
                        )
                    .padding(.horizontal, 20)
                    .offset(y:-30)
                    .multilineTextAlignment(.center)
                
                Text("Artistas: \(expo.artista)")
                    .font(Font.custom("MarkPro-Book", size: 18))
                
                Link(destination: URL(string:expo.linkVideo)!, label: {Label("Video", systemImage: "play.tv.fill")})
                
            }// VStack
        }// ZStack
    }
}

struct ExposDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExposDetailView(expo:ExposModel.defaultExpo)
    }
}
