//
//  ObrasViewModel.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 08/11/22.
//

import Foundation
import SwiftUI


class ObrasViewModel:ObservableObject{
    @Published var arrObras = [ObrasModel]()
    
    init(){
        getObras()
    }
    
    func getObras(){
        var obra:ObrasModel
        
        obra = ObrasModel.defaultObra
        
        arrObras.append(obra)
        arrObras.append(obra)
        arrObras.append(obra)
    }
}




