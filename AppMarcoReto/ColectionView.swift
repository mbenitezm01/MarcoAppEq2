//
//  ColectionView.swift
//  AppMarcoReto
//
//  Created by Alumno on 19/10/22.
//

import SwiftUI

struct ColectionView: View {
    @StateObject var obrasVM = ObrasViewModel()
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack{
            Color("ColorFondoMarco")
                .ignoresSafeArea()
        NavigationView{
            VStack{
                
                Text("Coleccion Marco")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .padding()
                    .frame(width: 500.0)
                    .scaledToFit()
                    .background(Color("Rosa Marco"))
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
                ScrollView(){
                    LazyVGrid(columns: threeColumnGrid, spacing: 20){
                        ForEach(obrasVM.arrObras) { item in
                            NavigationLink(destination: ObrasDetailView(obra: item), label: {
                                ObrasItemView(obra: item)
                            })
                            .frame(width: 120, height: 120)
                        }
                    }
                    .task {
                        do{
                            try await obrasVM.getObras()
                            print("llamda api")
                            print(obrasVM.arrObras)
                        }
                        catch{
                            print("Error", error)
                        }
                    }
                    
                }
                
                
                
            }//VStack
        }
        //NavigationView
    } // ZStack
    }
}

struct ColectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColectionView()
    }
}
