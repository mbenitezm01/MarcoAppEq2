//
//  ExposDetailView.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 15/11/22.
//

//
//  ExposDetailView.swift
//  AppMarco
//
//  Created by user189854 on 9/7/21.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit

class AudioManager : ObservableObject {
    var audioPlayer: AVPlayer?
    
    func playSound(audio: String){
        if let url = URL(string: audio) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}

struct ExposDetailView: View {
    var expo : Expos
    @State var audio1 = false
    @StateObject private var audioManager = AudioManager()
    @State private var indexGallery = 0
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var indexSponsors = 0
    
    
    var body: some View {
        
        
        ZStack{
            
            GeometryReader { geometry in
                
                Color("ColorFondoMarco")
                
                //ScrollView {
                
                ZStack(alignment: .center) {
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width * 0.95)
                        .frame(minHeight: 0, maxHeight: .infinity)
                    //                        .padding(.bottom, geometry.size.height * 0.1)
                    
                    ScrollView{
                        VStack (spacing: 0) {
                            AnimatedImage(url: URL(string: expo.images[0]))
                                .resizable()
                                .scaledToFill()
                                //.frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.5, alignment: .center)
                                .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95 / 1.09, alignment: .center)
                                .clipped()
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                            
                            VStack{

                                Text(expo.name)
                                    .font(.custom("MarkPro-Book", size: 20, relativeTo: .title2))
                                    .padding(.bottom, 5)
                                    .padding(.top, 5)
                                    .foregroundColor(.black)
                                
                                Text(expo.author)
                                    .font(.custom("MarkPro-Book", size: 20, relativeTo: .title3))
                                    .padding(.bottom,10)
                                    .foregroundColor(.black)
                                
                                HStack{
                                    Text(expo.startDate + " - " + expo.endDate)
                                        .font(.custom("MarkPro-Book", size: 15, relativeTo: .callout))
                                        .padding(6)
                                        .foregroundColor(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("Rosa Marco"))
                                        )
                                    
                                    Spacer()
                                            .frame(width: 25)
                                    
                                    //AddToFavoritosView(filter: expo)
                                }
                                
                                
                                Text(expo.description)
                                    .font(.custom("MarkPro-Book", size: 18))
                                    .frame(width: geometry.size.width * 0.90)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .foregroundColor(.black)
                                    //.fixedSize(horizontal: false, vertical: true)
                                
                                NavigationLink(
                                    destination: WebView(html: expo.virtualTourURL),
                                    label: {
                                        Text("RECORRIDO VIRTUAL")
                                            .font(.custom("MarkPro-Medium", size: 15, relativeTo: .callout))
                                            .padding(10)
                                            .foregroundColor(.white)                                    .background(
                                                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("RosaMarco"))
                                            )
                                    })
                            }
                            
                            Spacer()
                            WebView(html: expo.authorCapsuleURL)
                                //.frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.6, alignment: .center)
                                .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95 / 1.09, alignment: .center)
                                .padding(10)
                            
                            Text("GALERIA")
                                .font(.custom("MarkPro-Medium", size: 20, relativeTo: .title2))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(.leading)
                                //.padding(.vertical, geometry.size.height * 0.05)
                                .padding(.vertical, 20)
                                .foregroundColor(.black)
                            
                            if(expo.images.count != 0){
                                TabView(selection: $indexGallery){
                                    ForEach(1..<expo.images.count, id: \.self) {index in
                                        HStack (spacing: 0) {
                                            AnimatedImage(url: URL(string: expo.images[index]))
                                                .resizable()
                                                .scaledToFill()
                                                .padding(.leading, 10)
                                                .padding(.trailing, 10)
                                            
                                        }
                                        
                                    }
                                }
                                //.frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.6, alignment: .center)
                                .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95 / 1.09, alignment: .center)
                                .clipped()
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                            }
                            
                            //                                ScrollView(.horizontal) {
                            //                                    HStack {
                            //                                        ForEach(1..<expo.images.count, id: \.self) {item in
                            //                                            AnimatedImage(url: URL(string: expo.images[item]))
                            //                                                .resizable()
                            //                                                .scaledToFit()
                            //                                                .frame(width: 400, height: 350, alignment: .center)
                            //                                                .padding()
                            //                                        }
                            //                                    }
                            //                                }
                            
                            VStack(alignment: .leading) {
                                Text("CURADURIA: " + expo.curatorship)
                                    .font(.custom("MarkPro-LightItalic", size: 18))
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .foregroundColor(.gray)
                                
                                
                                Text("MUSEOGRAFIA: " + expo.museography)
                                    .font(.custom("MarkPro-LightItalic", size: 18))
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .foregroundColor(.gray)
                                
                                
                                Text("SALAS: " + expo.location + "\n")
                                    .font(.custom("MarkPro-LightItalic", size: 18))
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal )
                                    .foregroundColor(.gray)
                                
                                Text("TECNICA: " + expo.technique)
                                    .font(.custom("MarkPro-LightItalic", size: 18))
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal )
                                    .foregroundColor(.gray)
                                
                                Text("OBRAS: " + expo.totalPieces)
                                    .font(.custom("MarkPro-LightItalic", size: 18))
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal )
                                    .foregroundColor(.gray)
                                
                                // Sponsors
                                
                                if(expo.sponsors.count > 0){
                                    
                                    AnimatedImage(url: URL(string: expo.sponsors[0]))
                                    //Image("logoTest")
                                        .resizable()
                                        //.scaledToFill()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width * 0.95, alignment: .center)
                                        .frame(minHeight: 0, maxHeight: .infinity)
                                        .clipped()
                                        .padding(.leading, 10)
                                        .padding(.trailing, 10)
                                   
                                }
                                
                            }
                            //.frame(width: 400)
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar(content: {
                                    ToolbarItem(placement: .principal, content: {
                                        Image("LogoMarco")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 20)
                                    })
                                })
                            

                            
                        }
                    }
                    
                }
                
                //                }
                
            }
            
        }
    }
}
//
//struct ExposDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExposDetailView(expo: Expos(id: "id", name: "nombre", author: "autor", startDate: "fecha", endDate: "fecha", description: "descripcion", virtualTourURL: "url", authorCapsuleURL: "url", images: ["index"]))
//    }
//}


/*
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
*/
