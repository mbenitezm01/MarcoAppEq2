//
//  ObrasModel.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 08/11/22.
//

import Foundation

struct ObrasModel : Codable, Identifiable{
    var id:String
    var nombreImagen:[String]
    var artista:String
    var titulo:String
    var tecnica:String?
    var medidas:String?
    var year:Int
    var descripcion:String?
    var linkVideo:String?
    var modelName:String?
    
    enum CodingKeys : String, CodingKey{
        case id = "_id"
        case nombreImagen
        case artista
        case titulo
        case tecnica
        case medidas
        case year
        case descripcion
        case linkVideo
        case modelName
    }
}

extension ObrasModel{
    public static var defaultObra = ObrasModel(id:"1940149104" ,nombreImagen: ["marco dflt"], artista: "Anonimo", titulo: "Obra", tecnica: "Ninguna", medidas: "0*0", year: 1991, descripcion: "Esta obra es parte de la coleccion del Museo de Arte Contemporaneo, ubicado en Monterrey, Nuevo Leon, Mexico. Visitanos para conocerla!", linkVideo: "https://www.youtube.com/watch?v=fv1Q0SPWonk", modelName: "pirinola")
}
