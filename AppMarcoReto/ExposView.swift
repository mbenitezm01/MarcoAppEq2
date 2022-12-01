//
//  ExposView.swift
//  AppMarco
//
//  Created by Alumno on 01/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExposView: View {
    
    @EnvironmentObject private var expos : ExpoViewModel
//    @StateObject var expo = ExpoViewModel()
    
    var body: some View {
        ZStack {
            
            GeometryReader { geometry in
                
                Color("ColorFondoMarco")
                
//                ScrollView {
                    
                    ZStack(alignment: .center) {
                        
                        //                        .padding(.bottom, geometry.size.height * 0.1)
                        
                        if (!expos.isConected){
                            ServerErrorView()
                        }
                        else{
                        
                            if(expos.isLoading){
                                
                                VStack() {
                                    
                                    Spacer()
                                    
                                    ProgressView("Cargando exposiciones...")
                                        
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(.systemBackground))
                                                
                                        )
                                        .frame(width: geometry.size.width )
                                        .shadow(radius: 10)
                                    
                                    Spacer()
                                    
                                }
                                
                                
                            }
                            else {
                                
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: geometry.size.width * 0.95)
                                    .frame(minHeight: 0, maxHeight: .infinity)
                                
                                    if(expos.expos.count == 0){
                                        
                                        Text("No hay exposiciones disponibles por el momento")
                                            .font(.custom("MarkPro-book", size: 25))
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top, geometry.size.height * 0.4)
                                            .foregroundColor(.black)
                                    }
                                    
                                    else{
                                        
                                        ScrollView{
                                                VStack(spacing: 0){
                                                    
                                                    //                                    Text("EXPOSICIONES")
                                                    //                                        .font(.custom("Mark Pro Bold", size: 30))
                                                    //                                        .padding(.vertical, 20)
                                                    
                                                    ForEach(expos.expos){item in
                                                        
                                                        NavigationLink(
                                                            destination:
                                                                ZStack{
                                                                    Color("ColorFondoMarco")
                                                                    ExposDetailView(expo: item).frame(maxWidth: 600)
                                                                },
                                                            label: {
                                                                VStack(spacing: 0){
                                                                    
                                                                    AnimatedImage(url: URL(string: item.images[0]))
                                                                        .resizable()
                                                                        .scaledToFill()
                                                                    //.frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.5, alignment: .center)
                                                                        .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95 / 1.09, alignment: .center)
                                                                        .clipped()
                                                                        .padding(.leading, 10)
                                                                        .padding(.trailing, 10)
                                                                        .overlay(
                                                                            ZStack{
                                                                                Text(item.startDate + " - " + item.endDate)
                                                                                    .font(.custom("MarkPro-Book", size: 15, relativeTo: .callout))
                                                                                    .padding(6)
                                                                                    .foregroundColor(.white)
                                                                            }.background(Color("Rosa Marco"))
                                                                                .padding(.leading, 15)
                                                                                .padding(6), alignment: .bottomLeading
                                                                        )
                                                                }
                                                            })
                                                        
                                                        
                                                        Text(item.name)
                                                            .font(.custom("MarkPro-Book", size: 20, relativeTo: .title2))
                                                            .padding(.bottom, 5)
                                                            .padding(.top, 5)
                                                            .foregroundColor(.black)
                                                        Text(item.author)
                                                            .font(.custom("MarkPro-Book", size: 18, relativeTo: .title2))
                                                        //.padding(.bottom, geometry.size.height * 0.08)
                                                            .padding(.bottom, 20)
                                                            .foregroundColor(.black)
                                                        
                                                    }
                                                    
                                                }// VStack
                                        } // ScrollView
                                        
                                    } // IF
                            } // IF Connected
                        }
                        
                    }
                    
                    
//                }
 
            } // ZStack
        }//geometry
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

struct ExposView_Previews: PreviewProvider {
    static var previews: some View {
        ExposView()
    }
}


////
////  ExposView.swift
////  AppMarcoReto
////
////  Created by Alumno on 12/10/22.
////
//
//import SwiftUI
//
//struct ExposView: View {
//    var body: some View {
//        NavigationView{
//            ZStack{
//
//                Color(.white)
//                    .ignoresSafeArea()
//
//                ScrollView(){
//                    VStack{
//
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct ExposView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExposView()
//    }
//}
