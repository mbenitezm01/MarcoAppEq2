//
//  ObrasModel.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 08/11/22.
//

import Foundation

struct ObrasModel:Identifiable{
    var id = UUID()
    var nombreImagen:String
    var artista:String
    var titulo:String
    var tecnica:String
    var medidas:String
    var year:Int
    var descripcion:String
    var linkVideo:String
}

extension ObrasModel{
    public static var defaultObra = ObrasModel(nombreImagen: "marco dflt", artista: "Anonimo", titulo: "Obra", tecnica: "Ninguna", medidas: "0*0", year: 1991, descripcion: "Esta obra es parte de la coleccion del Museo de Arte Contemporaneo, ubicado en Monterrey, Nuevo Leon, Mexico. Visitanos para conocerla!", linkVideo: "https://www.youtube.com/watch?v=fv1Q0SPWonk")
}
