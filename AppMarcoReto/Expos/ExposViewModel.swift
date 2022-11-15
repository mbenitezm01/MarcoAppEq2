//
//  ExposViewModel.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 15/11/22.
//

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
