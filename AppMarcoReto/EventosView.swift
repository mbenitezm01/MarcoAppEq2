//
//  EventosView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

//
//  EventosView.swift
//  AppMarco
//
//  Created by user189854 on 10/17/21.
//
import SwiftUI
import SDWebImageSwiftUI

struct EventosView: View {
    let dateFormatter = DateFormatter()
    
    init(){
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "dd-MM-yyyy"
    }
    
    @EnvironmentObject private var eventos : EventosViewModel
//    @StateObject var evento = EventosViewModel()
    
    var body: some View {
        ZStack {
            
            GeometryReader { geometry in
                
                Color("BgVeige")
                
                ZStack(alignment: .center) {

                    if (!eventos.isConected){
                        ServerErrorView()
                    }
                    else{
                        if(eventos.isLoading){
                                VStack() {
                                    Spacer()
                                    
                                    ProgressView("Cargando eventos...")
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(.systemBackground))
                                        )
                                        .shadow(radius: 10)
                                    Spacer()
                                } // Vstack
                            }
                            else{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: geometry.size.width * 0.95)
                                    .frame(minHeight: 0, maxHeight: .infinity)
                                
                                if(eventos.eventos.count == 0){
                                    
                                    Text("No hay eventos disponibles por el momento")
                                        .font(.custom("Mark Pro Bold", size: 25))
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top, geometry.size.height * 0.4)
                                        .foregroundColor(.black)
                                    
                                } // if
                                else{
                                    ScrollView {
                                        VStack (spacing: 0) {
                                            
                                            ForEach(eventos.eventos){item in
                                                
                                                NavigationLink(
                                                    destination:
                                                        ZStack{
                                                            Color("ColorFondoMarco")
                                                            EventoDetailView(evento: item, dateFormatter: dateFormatter).frame(maxWidth: 600)
                                                        },
                                                    label: {
                                                        VStack(spacing: 0){
                                                            
                                                            AnimatedImage(url: URL(string: item.image))
                                                                .resizable()
                                                                .scaledToFill()
                                                                //.frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.5, alignment: .center)
                                                                .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95 / 1.09, alignment: .center)
                                                                .clipped()
                                                                .padding(.leading, 10)
                                                                .padding(.trailing, 10)
                                                                .overlay(
                                                                    ZStack{
                                                                        Text(dateFormatter.string(from: item.startDate))
                                                                            .font(.custom("MarkPro-Book", size: 15, relativeTo: .callout))
                                                                            .padding(6)
                                                                            .foregroundColor(.white)
                                                                    }.background(Color("Rosa Marco"))
                                                                    .padding(.leading, 15)
                                                                    .padding(6), alignment: .bottomLeading
                                                                )
                                                            
                                                        } //Vstack
                                                        
                                                    }) //Nav Link
                                                Text(item.name)
                                                    .font(.custom("MarkPro-Book", size: 20, relativeTo: .title2))
                                                    .padding(.bottom, 5)
                                                    .padding(.top, 5)
                                                    .foregroundColor(.black)
                                                    .multilineTextAlignment(.center)
                                                Text(item.author)
                                                    .font(.custom("MarkPro-Book", size: 18, relativeTo: .title2))
                                                    .padding(.bottom, 20)
                                                    .foregroundColor(.black)
                                            }
                                            
                                        }// VStack
                                    }//Scroll View
                                    
                                } // else
                            } // else
                        
                    }// else
                }// zstack
                    
            }//geometry
            
        }//zstack
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                    Image("LogoMarco")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                })
            })
        } //body
    }// View

struct EventosView_Previews: PreviewProvider {
    static var previews: some View {
        EventosView()
        
    }
}


/*
import SwiftUI

struct EventosView: View {
    @StateObject var EventosVM = EventosViewModel()

    var body: some View {
        NavigationView{
            ZStack{
                Color("ColorFondoMarco")
                    .ignoresSafeArea()
                
                ScrollView(){
                    VStack(spacing: 20){
                        ForEach(EventosVM.arrEventos) { item in
                            NavigationLink(destination: EventosDetailView(evento: item), label: {
                                EventosItemView(evento: item)
                            })
                        }
                    }
                }
            }
        }
    }
}

struct EventosView_Previews: PreviewProvider {
    static var previews: some View {
        EventosView()
    }
}
*/
