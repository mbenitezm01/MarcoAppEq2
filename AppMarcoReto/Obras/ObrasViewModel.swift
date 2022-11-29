//
//  ObrasViewModel.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 08/11/22.
//

import Foundation
import SwiftUI


class ObrasViewModel : ObservableObject{
    @Published var arrObras = [ObrasModel]()
    
    /*init() {
        
      getObras()
    
    }*/
    
    func getObras() async throws{
        //var obra:ObrasModel
        
        //obra = ObrasModel.defaultObra
        
        //arrObras.append(obra)
        //arrObras.append(obra)
        //arrObras.append(obra)
        
        guard let url = URL(string: "http://10.14.255.68:10205/expos")
        else{
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let(data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        
        let results = try JSONDecoder().decode([ObrasModel].self, from: data)
        
        DispatchQueue.main.async {
            self.arrObras = results
            print(results)
        }
    }
}




