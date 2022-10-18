//
//  ActividadView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI

struct ActividadView: View {
    var body: some View {
            VStack{
                Text("Puntos: 0")
                    .padding()
                    .offset(x: -125)
                Text("¿Cual es el nombre de esta obra?")
                Image("CasinoFilosofico")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Button(action: {
                    print("Respuesta Equivocada")
                    }, label: {
                        Text("Dados Filosoficos")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width:350, height: 75)
                            .background(Color.brown)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            
                    })
                
                Button(action: {
                    print("Respuesta Equivocada")
                    }, label: {
                        Text("Filosofia en lo Azar")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width:350, height: 75)
                            .background(Color.brown)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            
                    })
                Button(action: {
                    print("Respuesta Equivocada")
                    }, label: {
                        Text("Apuesta Filosofica")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width:350, height: 75)
                            .background(Color.brown)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            
                    })
                Button(action: {
                    print("Respuesta Correcta")
                    }, label: {
                        Text("Casino Filosofico")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width:350, height: 75)
                            .background(Color.brown)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                                                })
                .padding(.bottom, 60)
                
                
                
            }
    }
}

struct ActividadView_Previews: PreviewProvider {
    static var previews: some View {
        ActividadView()
    }
}
