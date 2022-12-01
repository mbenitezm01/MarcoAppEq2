//
//  ExposViewModel.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 15/11/22.
//

//
//  ExpoModel.swift
//  AppMarco
//
//  Created by user189854 on 9/5/21.
//
import SwiftUI

class ExpoViewModel: ObservableObject{
    @Published var expos = [Expos]()
    @Published var isLoading = false
    @Published var isConected = true
    
    init(){
        getExpos()
    }
    func getExpos(){
        isLoading = true
        WebService().getExpos(){ result in
            switch result {
            case .success(let exposResult):
                    print("expos obtenidas")
                self.expos = exposResult
                self.isLoading = false
                
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.isConected = false
                }
            }
        }
    }
    
    
}

/*
import Foundation
import SwiftUI




class ExposViewModel:ObservableObject{
    @Published var arrExpos = [ExposModel]()
    
    init(){
        getExpos()
    }
    
    func getExpos(){
        var expo:ExposModel
        
        expo = ExposModel.defaultExpo
        
        arrExpos.append(expo)
        arrExpos.append(expo)
        arrExpos.append(expo)
    }
}
*/
