//
//  ServerErrorView.swift
//  App Museo Marco
//
//  Created by Invitado on 2/4/22.
//

import SwiftUI

struct ServerErrorView : View {

    var body: some View{

    ZStack{
        GeometryReader { geometry in
            Color(.white)
            
            VStack{
                Image("logoNegroMarco")
                    .resizable()
                    .frame(width:32, height: 32)
                    .padding(.top, geometry.size.height * 0.2)
                Text("¡Oh no!")
                    .font(.custom("MarkPro-Book", size: 27))
                    .bold()
                    .foregroundColor(.black)
                Text("Parece ser que se perdió la conexión.")
                    .font(.custom("MarkPro-Book", size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
        
                VStack{
                    
                    Image("palomaMarcoError")
                        .resizable()
                        .scaledToFit()
                        
                }//VStack
                
                Text("Es posible que el servidor este bajo mantenimiento o hayas perdido conexion al internet. ")
                    .font(.custom("MarkPro-Book", size: 15))
                    .foregroundColor(.black)
                    .frame(alignment: .center)
                    .padding(20)
                

            }//VStack
        }// Geometry
        .ignoresSafeArea(.all, edges:.top)
            
                
    }//Zstack
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .principal, content: {
                Image("LogoMarco")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                })
            })
        }//struct
}//View




