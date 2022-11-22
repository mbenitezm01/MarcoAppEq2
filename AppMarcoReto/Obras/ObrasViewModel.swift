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
        /*
        var obra:ObrasModel
        
        obra = ObrasModel.defaultObra
        
        arrObras.append(obra)
        arrObras.append(obra)
        arrObras.append(obra)
         */
        
        var obra1:ObrasModel
        var obra2:ObrasModel
        var obra3:ObrasModel
        var obra4:ObrasModel
        
        obra1 = ObrasModel(nombreImagen: "marco dflt", artista: "Anonimo", titulo: "Obra1", tecnica: "Ninguna", medidas: "0*0", year: 1991, descripcion: "Esta obra es parte de la coleccion del Museo de Arte Contemporaneo, ubicado en Monterrey, Nuevo Leon, Mexico. Visitanos para conocerla!", linkVideo: "https://www.youtube.com/watch?v=fv1Q0SPWonk", modelName: "pirinola")
        obra2 = ObrasModel(nombreImagen: "marco dflt", artista: "Anonimo", titulo: "Obra2", tecnica: "Ninguna", medidas: "0*0", year: 1991, descripcion: "Esta obra es parte de la coleccion del Museo de Arte Contemporaneo, ubicado en Monterrey, Nuevo Leon, Mexico. Visitanos para conocerla!", linkVideo: "https://www.youtube.com/watch?v=fv1Q0SPWonk", modelName: "pirinola")
        obra3 = ObrasModel(nombreImagen: "marco dflt", artista: "Anonimo", titulo: "Obra3", tecnica: "Ninguna", medidas: "0*0", year: 1991, descripcion: "Esta obra es parte de la coleccion del Museo de Arte Contemporaneo, ubicado en Monterrey, Nuevo Leon, Mexico. Visitanos para conocerla!", linkVideo: "https://www.youtube.com/watch?v=fv1Q0SPWonk", modelName: "gramophone")
        obra4 = ObrasModel(nombreImagen: "marco dflt", artista: "Anonimo", titulo: "Obra4", tecnica: "Ninguna", medidas: "0*0", year: 1991, descripcion: "Esta obra es parte de la coleccion del Museo de Arte Contemporaneo, ubicado en Monterrey, Nuevo Leon, Mexico. Visitanos para conocerla!", linkVideo: "https://www.youtube.com/watch?v=fv1Q0SPWonk", modelName: "gramophone")
        
        arrObras.append(obra1)
        arrObras.append(obra2)
        arrObras.append(obra3)
        arrObras.append(obra4)
        
    }
}




