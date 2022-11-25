//
//  ObrasDetailView.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 08/11/22.
//

import SwiftUI

struct ObrasDetailView: View {
    
    //@StateObject var ObraVM = ObrasModel()
    let obra:ObrasModel
    
    
    var body: some View {
            ZStack{
                Color("ColorFondoMarco")
                    .ignoresSafeArea()
                VStack{
                    AsyncImage(url: URL(string: "http://10.14.255.68:10205/" + obra.nombreImagen[0])){phase in
                        if let image = phase.image{
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width:250)
                                .clipShape(Rectangle())
                                .shadow(radius:7)
                                .offset(y:-50)
                            
                            
                        } else if phase.error != nil{
                            Color.red
                        } else {
                            Color.blue
                        }
                    }
                    
                    Text(obra.titulo)
                        .font(Font.custom("MarkPro-Book", size: 40))
                        .offset(y:-50)
                    
                    Text("\(obra.artista), \(String(obra.year))")
                        .font(Font.custom("MarkPro-Book", size: 20))
                        .offset(y:-50)
                    
                    Text("Tecnica: \(String(obra.tecnica ?? "N/A"))")
                        .font(Font.custom("MarkPro-Book", size: 20))
                        .offset(y:-50)
                    
                    Text("Medidas: \(String(obra.medidas ?? "N/A"))")
                        .font(Font.custom("MarkPro-Book", size: 20))
                        .offset(y:-50)
                    Text("\n\(obra.descripcion)")
                        .font(Font.custom("MarkPro-Book", size: 20)
                        )
                        .padding(.horizontal, 20)
                        .offset(y:-50)
                        .multilineTextAlignment(.center)
                    Link(destination: URL(string:obra.linkVideo ?? "https://www.youtube.com/watch?v=fv1Q0SPWonk")!, label: {Label("Video", systemImage: "play.tv.fill")})
                    //NavigationLink(destination: WebView(html: obra.linkVideo), label: {Label("Video", systemImage: "play.tv.fill")})
                    
                    HStack{
                        NavigationLink(destination: ExposDetailView(expo: ExposModel.defaultExpo), label: {Label("Quiz", systemImage: "questionmark.app.fill")}) // cambiar la destination despues
                        //                    NavigationLink(destination: ScanView(modelName: obra.modelName), label:{Text("3D")
                        //                            .background(.brown)
                        //                            .foregroundColor(.white)})
                    }//HStack
                }//VStack
            }//ZStack
            .navigationViewStyle(.stack)
        }
}

struct ObrasDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ObrasDetailView(obra: ObrasModel.defaultObra)
    }
}
