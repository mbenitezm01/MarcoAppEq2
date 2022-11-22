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
        NavigationView{
        ZStack{
            Color("ColorFondoMarco")
                .ignoresSafeArea()
            VStack{
                Image(obra.nombreImagen)
                    .resizable()
                    .scaledToFit()
                    .frame(width:250)
                    .clipShape(Rectangle())
                    .shadow(radius:7)
                    .offset(y:-50)
                
                Text(obra.titulo)
                    .font(Font.custom("MarkPro-Book", size: 40))
                    .offset(y:-50)
                
                Text("\(obra.artista), \(String(obra.year))")
                    .font(Font.custom("MarkPro-Book", size: 20))
                    .offset(y:-50)
                
                Text("Tecnica: \(String(obra.tecnica))")
                    .font(Font.custom("MarkPro-Book", size: 20))
                    .offset(y:-50)
                
                Text("Medidas: \(String(obra.medidas))")
                    .font(Font.custom("MarkPro-Book", size: 20))
                    .offset(y:-50)
                Text("\n\(obra.descripcion)")
                    .font(Font.custom("MarkPro-Book", size: 20)
                    )
                    .padding(.horizontal, 20)
                    .offset(y:-50)
                    .multilineTextAlignment(.center)
                Link(destination: URL(string:obra.linkVideo)!, label: {Label("Video", systemImage: "play.tv.fill")})
                    //NavigationLink(destination: WebView(html: obra.linkVideo), label: {Label("Video", systemImage: "play.tv.fill")})
                
                HStack{
                    Text("Quiz")
                        .background(.brown)
                        .foregroundColor(.white)
                    NavigationLink(destination: ExposDetailView(expo: ExposModel.defaultExpo), label:{Text("3D")
                            .background(.brown)
                            .foregroundColor(.white)})
                }//HStack
            }//VStack
        }//ZStack
    }//NavigationView
        .navigationViewStyle(.stack)
    }
}

struct ObrasDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ObrasDetailView(obra:ObrasModel.defaultObra)
    }
}
