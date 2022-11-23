//
//  EventosModel.swift
//  AppMarcoReto
//
//  Created by Eduardo Pons on 23/11/22.
//

import Foundation

struct EventosModel:Identifiable{
    var id = UUID()
    var nombreImagen:String
    var nombreEvento:String
    var fechaInicio:String
    var fechaFin:String
    var descripcion:String
}

extension EventosModel{
    public static var defaultEvento = EventosModel(nombreImagen: "marco dflt", nombreEvento: "Evento", fechaInicio: "28-06-1991", fechaFin: "28-06-1991", descripcion: "Descripcion eventos")
}
