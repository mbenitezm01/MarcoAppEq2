//
//  AppMarcoRetoApp.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI

@main
struct AppMarcoRetoApp: App {
    
    @StateObject var expos = ExpoViewModel()
    @StateObject var eventos = EventosViewModel()


    var body: some Scene {
        WindowGroup {
                ContentView()
                    .environmentObject(expos)
                    .environmentObject(eventos)
        }
    }
}
