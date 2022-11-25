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
        NavigationView{
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
                    LazyVGrid(columns: threeColumnGrid, spacing: 20){
                        ForEach(obrasVM.arrObras) { item in
                            NavigationLink(destination: ObrasDetailView(obra: item), label: {
                                ObrasItemView(obra: item)
                            })
                            .frame(width: 120, height: 120)
                        }
                    }
                }
            }//VStack
        } //NavigationView
    }
}

struct ColectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColectionView()
    }
}
