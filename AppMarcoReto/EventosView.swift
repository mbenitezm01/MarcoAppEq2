//
//  EventosView.swift
//  AppMarcoReto
//
//  Created by Alumno on 12/10/22.
//

import SwiftUI

struct EventosView: View {
    @StateObject var EventosVM = EventosViewModel()

    var body: some View {
        NavigationView{
            ZStack{
                Color("ColorFondoMarco")
                    .ignoresSafeArea()
                
                ScrollView(){
                    VStack(spacing: 20){
                        ForEach(EventosVM.arrEventos) { item in
                            NavigationLink(destination: EventosDetailView(evento: item), label: {
                                EventosItemView(evento: item)
                            })
                        }
                    }
                }
            }
        }
    }
}

struct EventosView_Previews: PreviewProvider {
    static var previews: some View {
        EventosView()
    }
}
