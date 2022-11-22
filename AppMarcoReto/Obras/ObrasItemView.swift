//
//  ObrasItemView.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 08/11/22.
//

import SwiftUI

struct ObrasItemView: View {
    
    let obra:ObrasModel
    
    var body: some View {
        Image(obra.nombreImagen)
            .resizable()
            .scaledToFit()
            .frame(width:240)
            .overlay(alignment: .topLeading, content: {
                Text(obra.titulo)
                    .font(.custom("MarkPro-Book", size: 20))
                    .foregroundColor(.white)
                    //.stroke(color.black)
                    .padding()
                    
            })
    }
}

struct ObrasItemView_Previews: PreviewProvider {
    static var previews: some View {
        ObrasItemView(obra:ObrasModel.defaultObra)
    }
}
