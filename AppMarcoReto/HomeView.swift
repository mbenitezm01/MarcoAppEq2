//
//  HomeView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Text("Expos")
                .font(Font.custom("MarkPro-Book",size: 36))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) { // HStack(spacing:20)
                    ForEach(1..<4) {
                        Text("Obra \($0)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(.red)
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
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
