//
//  ExposModel.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 15/11/22.
//

import Foundation

struct ExposModel:Identifiable{
    var id = UUID()
    var nombreImagen:String
    var titulo:String
    var fechaInicio:String
    var fechaFin:String
    var artista:String
    var descripcion:String
    var linkVideo:String
}

extension ExposModel{
    public static var defaultExpo = ExposModel(nombreImagen: "marco dflt", titulo: "Expo", fechaInicio: "28-06-1991", fechaFin: "28-06-1991", artista: "Anonimo", descripcion: "Visita nuestra mas reciente exposicion en el Museo de Arte Contemporaneo de Monterrey, ubicado en Juan Zuazua, Padre Raymundo Jardón y, Centro, 64000 Monterrey, N.L.", linkVideo: "https://www.youtube.com/watch?v=fv1Q0SPWonk")
}
