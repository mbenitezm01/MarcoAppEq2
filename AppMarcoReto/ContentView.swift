//
//  ContentView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            
            HomeView()
                .tabItem{
                    Text("Home")
                    Image(systemName: "house.fill")
                }
            NavigationView{
                ExposView()
                    }
            .tabItem{
                Text("Expos")
                Image(systemName: "film")
            }
            
            NavigationView{
                EventosView()
            }
                .tabItem{
                    Text("Eventos")
                    Image(systemName: "calendar")
                }
//            ScanView(modelName: "model")
//                .tabItem{
//                    Text("Scan")
//                    Image(systemName: "qrcode")
//                }
            ColectionView()
                .tabItem{
                    Text("Coleccion")
                    Image(systemName: "photo.artframe")
                    Image(systemName: "house.fill")
                }
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
