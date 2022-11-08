//
//  ObrasDetailView.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 08/11/22.
//

import SwiftUI

struct ObrasDetailView: View {
    
    let obra:ObrasModel
    
    var body: some View {
        VStack{
            Image(obra.nombreImagen)
                .resizable()
                .scaledToFit()
                .frame(width:250)
                .clipShape(Rectangle())
                .shadow(radius:7)
                .offset(y:-100)
            
            Text(obra.titulo)
                .font(Font.custom("MarkPro-Book", size: 65))
                .offset(y:-100)
            
            Text("\(obra.artista), \(String(obra.year))")
                .font(Font.custom("MarkPro-Book", size: 20))
                .offset(y:-100)
            
            Text("Tecnica: \(String(obra.tecnica))")
                .font(Font.custom("MarkPro-Book", size: 20))
                .offset(y:-100)
            
            Text("Medidas: \(String(obra.medidas))")
                .font(Font.custom("MarkPro-Book", size: 20))
                .offset(y:-100)
            Text("\n\(obra.descripcion)")
                .font(Font.custom("MarkPro-Book", size: 20))
                .offset(y:-100)
                .multilineTextAlignment(.center)
            Link(destination: URL(string:obra.linkVideo)!, label: {Label("Video", systemImage: "play.tv.fill")})
        }//VStack
    }
}

struct ObrasDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ObrasDetailView(obra:ObrasModel.defaultObra)
    }
}
