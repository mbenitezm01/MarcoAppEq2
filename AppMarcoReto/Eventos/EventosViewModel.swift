//
//  EventosViewModel.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 30/11/22.
//

//
//  EventosViewModel.swift
//  AppMarco
//
//  Created by user189854 on 10/18/21.
//
import SwiftUI

class EventosViewModel: ObservableObject{
    @Published var eventos = [Eventos]()
    @Published var isLoading = false
    @Published var isConected = true
    
    init(){
        getActivity()
    }
    func getActivity(){
        isLoading = true
        WebService().getEventos(){ result in
            switch result {
            case .success(let exposResult):
                    print("eventos obtenidas")
                self.eventos = exposResult
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
