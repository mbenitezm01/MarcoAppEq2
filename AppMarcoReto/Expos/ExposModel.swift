//
//  Expos.swift
//  AppMarco
//
//  Created by user189854 on 9/5/21.
//
import SwiftUI

//struct Expos: Codable, Identifiable {
//    var id = UUID()
//    var sNombre: String
//    var sAutor: String
//    var sFecha: String
//    var sDescripcion: String
//    var urlVisita: String
//    var arrImages: [String]
//}

struct ExposResponse : Codable {
    var expos : [Expos]
}

struct Expos: Codable, Identifiable {
    var id : String
    var name : String
    var author : String
    var startDate : String
    var endDate : String
    var description : String
    var virtualTourURL : String
    var authorCapsuleURL : String
    var images : [String]
    var sponsors : [String]
    var audio : String
    var curatorship : String
    var museography : String
    var location : String
    var technique : String
    var totalPieces : String
    
    enum CodingKeys: String, CodingKey{
        case id = "_id"
        case name
        case author
        case startDate
        case endDate
        case description
        case virtualTourURL
        case authorCapsuleURL
        case images
        case sponsors
        case audio
        case curatorship
        case museography
        case location
        case technique
        case totalPieces
    }
}

/*
 
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
 */
