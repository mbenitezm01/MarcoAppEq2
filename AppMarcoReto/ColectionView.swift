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
            HStack{
                Button(action: {
                    
                    }, label: {
                        Text("Preguntas sobre las obras")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .padding()
                            .scaledToFit()
                            .background(Color.brown)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            
                            
                    })
                Button(action: {
                    print("Respuesta Equivocada")
                    }, label: {
                        Text("Actividades Interactivas")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .padding()
                            .scaledToFit()
                            .background(Color.brown)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            

                            
                    })
            }
            .padding()
            HStack{
                Image("LibertyStatue")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Image("CasinoFilosofico")
                    .resizable()
                    .scaledToFit()
                Image("Guitarra")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
            }
            .padding()
            HStack{
                Image("LibertyStatue")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Image("CasinoFilosofico")
                    .resizable()
                    .scaledToFit()
                Image("Guitarra")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
            }
            .padding()
            HStack{
                Image("LibertyStatue")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Image("CasinoFilosofico")
                    .resizable()
                    .scaledToFit()
                Image("Guitarra")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
            }
            .padding()
            
            
            
            
        }
    }
}

struct ColectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColectionView()
    }
}
