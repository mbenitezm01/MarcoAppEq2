//
//  Eventos.swift
//  AppMarcoReto
// modelo de los eventos
//  Created by Rene Kipper on 30/11/22.
//

//
//  Eventos.swift
//  AppMarco
//
//  Created by user189854 on 10/17/21.
//

import SwiftUI

struct EventosResponse : Codable {
    var eventos : [Eventos]
}

struct Eventos : Codable, Identifiable {
    
    var id: String
    var name: String
    var author: String
    var startDate: Date
    var endDate : Date
    var description: String
    var image: String
    var hour: String
    var location: String
    var organizer: String
    var paidActivity: Bool
    var urlTickets: String
        
    enum CodingKeys: String, CodingKey{
        case id = "_id"
        case name
        case author
        case startDate
        case endDate
        case description
        case image
        case hour
        case location
        case organizer
        case paidActivity
        case urlTickets
    }
}



