//
//  HomeView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var obrasVM = ObrasViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                Color("ColorFondoMarco")
                    .ignoresSafeArea()
                VStack{
                    Text("Expos")
                        .font(Font.custom("MarkPro-Book",size: 36))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) { // HStack(spacing:20)
                            ForEach(obrasVM.arrObras) { item in NavigationLink(destination:ObrasDetailView(obra: item),label:{ObrasItemView(obra:item)})
                                /*Text("Obra \($0)")
                                 .foregroundColor(.white)
                                 .font(.largeTitle)
                                 .frame(width: 200, height: 200)
                                 .background(.red)*/
                            } // ForEach
                        } // HStack
                    } // ScrollView
                    Text("Eventos")
                        .font(Font.custom("MarkPro-Book",size: 36))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(1..<4) {
                                Text("Evento \($0)")
                                    .font(Font.custom("MarkPro-Book",size: 36))
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 200, height: 200)
                                    .background(.red)
                            } // ForEach
                        } // HStack
                    } // ScrollView
                    
                } // VStack
            }//ZStack
        }//NavigationView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
