//
//  HomeView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    let dateFormatter = DateFormatter()
    
    init(){
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "dd-MM-yyyy"
    }
    
    @StateObject var obrasVM = ObrasViewModel()
    
    @State private var indexExpos = 0
    @State private var indexEventos = 0

    @EnvironmentObject private var expos : ExpoViewModel
    @EnvironmentObject private var eventos : EventosViewModel

    //@StateObject var exposVM = ExposViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                Color("ColorFondoMarco")
                    .ignoresSafeArea()
                ScrollView(.vertical){
                    VStack{
                        Text("Expos")
                            .font(Font.custom("MarkPro-Book",size: 45))
                            .foregroundColor(.black)
//                        TabView{
//                            ForEach(exposVM.arrExpos) { item in NavigationLink(destination:ExposDetailView(expo: item),label:{ExposItemView(expo:item)})
//
//                            }
//                        }
                            TabView(selection: $indexExpos){
                                ForEach((0..<expos.expos.count), id: \.self) { index in
                                    NavigationLink(
                                        destination:
                                            ZStack{
                                                Color("ColorFondoMarco")
                                                ExposDetailView(expo: expos.expos[index]).frame(maxWidth: 600)
                                            },
                                            
                                        label: {
                                            HStack(spacing: 0){
                                                AnimatedImage(url: URL(string: expos.expos[index].images[0]))
                                                    .resizable()
                                                    .scaledToFill()
                                                    //.frame(minHeight: 0, maxHeight: .infinity)
                                                    .clipped()
                                            }
                                        })
                                }
                            } // TabView Expos
                        .navigationViewStyle(.stack)
                        .frame(width: 250, height: 250, alignment: .center)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        
                        if (eventos.isConected){
                            if (eventos.eventos.count != 0){
                                Text("Eventos")
                                                            .font(Font.custom("MarkPro-Book",size: 45))
                                                        TabView(selection: $indexEventos){
                                                            ForEach((0..<eventos.eventos.count), id: \.self) { index in
                                                                NavigationLink(
                                                                    destination:
                                                                        ZStack{
                                                                            Color("ColorFondoMarco")
                                                                            EventoDetailView(evento: eventos.eventos[index], dateFormatter: dateFormatter).frame(maxWidth: 600)
                                                                        },
                                                                        
                                                                    label: {
                                                                        HStack(spacing: 0){
                                                                            
                                                                            AnimatedImage(url: URL(string: eventos.eventos[index].image))
                                                                                .resizable()
                                                                                .scaledToFill()
                                                                                //.aspectRatio(1080/990, contentMode: .fill)
                                                                                .clipped()
                                                                        }
                                                                    })
                                                            }
                                                        } // TabView Eventos
                                                        .navigationViewStyle(.stack)
                                                        .frame(width: 250, height: 250, alignment: .center)
                                                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                            } // if .count
                            else{
                                Text("No hay eventos dispnibles por el momento")
                                    .font(.custom("MarkPro-Book", size: 20))
                                    .padding(.vertical, 20)
                                    .foregroundColor(.black)
                            }
                        } // if isConnected
                        
                        
                    } // VStack
                } // ScrollView
            } // ZStack
        } // NavigationView
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
