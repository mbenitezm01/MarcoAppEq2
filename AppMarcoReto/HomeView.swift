//
//  HomeView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var obrasVM = ObrasViewModel()
    @StateObject var exposVM = ExposViewModel()
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
                            ForEach(exposVM.arrExpos) { item in NavigationLink(destination:ExposDetailView(expo: item),label:{ExposItemView(expo:item)})
                                
                            } // ForEach
                        } // HStack
                    } // ScrollView
                    Text("Eventos")
                        .font(Font.custom("MarkPro-Book",size: 36))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) { // HStack(spacing:20)
                            ForEach(obrasVM.arrObras) { item in NavigationLink(destination:ObrasDetailView(obra: item),label:{ObrasItemView(obra:item)})
                                
                            } // ForEach
                        } // HStack
                    } // ScrollView
                    
                } // VStack
            } // ZStack
        } // NavigationView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
