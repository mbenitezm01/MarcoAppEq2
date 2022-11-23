//
//  EventosViewModel.swift
//  AppMarcoReto
//
//  Created by Eduardo Pons on 23/11/22.
//

import Foundation
import SwiftUI


class EventosViewModel:ObservableObject{
    @Published var arrEventos = [EventosModel]()
    
    init(){
        getEventos()
    }
    
    func getEventos(){
        var evento:EventosModel
        
        evento = EventosModel.defaultEvento
        
        arrEventos.append(evento)
        arrEventos.append(evento)
        arrEventos.append(evento)
    }
}
