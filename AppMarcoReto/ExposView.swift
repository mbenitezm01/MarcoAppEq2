//
//  ExposView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI

struct ExposView: View {
    
    @StateObject var ExposVM = ExposViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("ColorFondoMarco")
                    .ignoresSafeArea()
                
                ScrollView(){
                    VStack(spacing: 20){
                        ForEach(ExposVM.arrExpos) { item in
                            NavigationLink(destination: ExposDetailView(expo: item), label: {
                                ExposItemView(expo: item)
                            })
                        }
                    }
                }
            }
        }
    }
}

struct ExposView_Previews: PreviewProvider {
    static var previews: some View {
        ExposView()
    }
}
