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
                ScrollView(.vertical){
                    VStack{
                        Text("Expos")
                            .font(Font.custom("MarkPro-Book",size: 45))
                        TabView{
                            ForEach(exposVM.arrExpos) { item in NavigationLink(destination:ExposDetailView(expo: item),label:{ExposItemView(expo:item)})
                                
                            }
                        }
                        .frame(width: 250, height: 250, alignment: .center)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        
                        
                        //NavigationLink(destination: <#T##() -> _#>, label: <#T##() -> _#>)
                        Text("Eventos")
                            .font(Font.custom("MarkPro-Book",size: 45))
                        TabView{
                            ForEach(obrasVM.arrObras) { item in NavigationLink(destination:ObrasDetailView(obra: item),label:{ObrasItemView(obra:item)})
                                
                            } // ForEach
                        } // TabView
                        .frame(width:250, height: 250, alignment: .center)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
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
                        
                    } // VStack
                } // ScrollView
            } // ZStack
        } // NavigationView
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
