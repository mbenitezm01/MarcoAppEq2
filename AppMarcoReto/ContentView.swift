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
            ExposView()
                .tabItem{
                    Text("Expos")
                    Image(systemName: "house.fill")
                }
            EventosView()
                .tabItem{
                    Text("Eventos")
                    Image(systemName: "house.fill")
                }
            ScanView()
                .tabItem{
                    Text("Scan")
                    Image(systemName: "house.fill")
                }
            ActividadView()
                .tabItem{
                    Text("Interactivo")
                    Image(systemName: "house.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
