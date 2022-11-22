//
//  ColectionView.swift
//  AppMarcoReto
//
//  Created by Alumno on 19/10/22.
//

import SwiftUI

struct ColectionView: View {
    var body: some View {
        VStack{
            
            Text("Obras ")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(2)
                .padding()
                .frame(width: 500.0)
                .scaledToFit()
                .background(Color.brown)
                .cornerRadius(10)
                .shadow(radius: 10)
            
            ScrollView(){
                HStack{

                    Image("LadyLiberty")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                    Image("CasinoFilosofico")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                    Image("Guitarra")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                }
                .padding()
                HStack{
                    Image("Stargazer")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                    Image("PlaceHolder")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                    Image("PlaceHolder")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                }
                .padding()
                HStack{
                    Image("PlaceHolder")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                    Image("PlaceHolder")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                    Image("PlaceHolder")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                }
                .padding()
                HStack{
                    Image("PlaceHolder")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                    Image("PlaceHolder")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                    Image("PlaceHolder")
                        .resizable()
                        .frame(width: 110.0, height: 110.0)
                }
                .padding()
                
            }
            
            
            
            
            
        }
    }
}

struct ColectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColectionView()
    }
}
