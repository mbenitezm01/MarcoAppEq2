//
//  WebServices.swift
//  Login
//
//  Created by Elvia Rosas on 14/09/21.
//
// Imported from release app

import Foundation

enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}

enum ComunicationError: Error{
    case connectionError
    case custom(errorMessage: String)
}








struct TicketPriceGeneralResponse: Codable {
    let ticketPriceGeneral : Int
}

struct TicketPriceDiscountResponse: Codable{
    let ticketPriceDiscount : Int
}

struct UrlMenuResponse: Codable{
    let urlMenu : String
}


class WebService{
    let ipaddress:String = "https://admin.marco.org.mx/api"
    
 
    
    
    
    
    
    func getExpos(completion: @escaping (Result<[Expos], ComunicationError>) -> Void) {
            
            //guard let url = URL(string: ipaddress + "/expos") else {
        guard let url = URL(string: ipaddress + "/expos/current") else {
                completion(.failure(.custom(errorMessage
                                                : "URL is not Correct")))
                return
            }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.connectionError))
            }
            
            guard let exposResponse = try? JSONDecoder().decode([Expos].self, from: data) else {
                completion(.failure(.connectionError))
                return
            }
            
            //let exposResponse = try! JSONDecoder().decode([Expos].self, from: data!)
            DispatchQueue.main.async {
                completion(.success(exposResponse))
            }
            
        }.resume()
        
    }
    
    func getEventos(completion: @escaping (Result<[Eventos], ComunicationError>) -> Void) {

        let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .formatted(formatter)

        guard let url = URL(string: ipaddress + "/activities/month") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data, error == nil else {
                return completion(.failure(.connectionError))
            }
                //let eventosResponse = try! decoder.decode([Eventos].self, from: data!)
            //guard let eventosResponse = try? JSONDecoder().decode([Eventos].self, from: data!) else {
            guard let eventosResponse = try? decoder.decode([Eventos].self, from: data) else {
                completion(.failure(.connectionError))
                return
            }

            DispatchQueue.main.async {
                completion(.success(eventosResponse))
            }

        }.resume()
    }
    
    
    
    
    func getUrlMenu(completion: @escaping (Result<UrlMenuResponse, ComunicationError>) -> Void) {
            
            guard let url = URL(string: ipaddress + "/priceandmenu/urlMenu") else {
                completion(.failure(.custom(errorMessage
                                                : "URL is not Correct")))
                return
            }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.connectionError))
            }
            
            guard let apiResponse = try? JSONDecoder().decode(UrlMenuResponse.self, from: data) else {
                completion(.failure(.connectionError))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(apiResponse))
            }
            
        }.resume()
        
    }

    
    
}
