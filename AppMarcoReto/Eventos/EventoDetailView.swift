//
//  EventoDetailView.swift
//  AppMarcoReto
//
//  Created by Rene Kipper on 30/11/22.
//

//
//  EventoDetailView.swift
//  AppMarco
//
//  Created by user189854 on 10/19/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventoDetailView: View {
    
    var evento: Eventos
    var dateFormatter : DateFormatter
    
    var body: some View {
        
        ZStack{
            
            GeometryReader { geometry in
                
                Color("ColorFondoMarco")
                
//                ScrollView {
                    
                    ZStack(alignment: .center) {
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: geometry.size.width * 0.95)
                            .frame(minHeight: 0, maxHeight: .infinity)
                        //                        .padding(.bottom, geometry.size.height * 0.1)
                        
                        ScrollView{
                            
                            VStack{
                                AnimatedImage(url: URL(string: evento.image))
                                    .resizable()
                                    .scaledToFill()
                                    //.frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.5, alignment: .center)
                                    .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95 / 1.09, alignment: .center)
                                    .clipped()
                                    .padding(.leading, 10)
                                    .padding(.trailing, 10)
                                
                                VStack{
                                    
                                    Text(evento.name)
                                        .font(.custom("MarkPro-Book", size: 20, relativeTo: .title2))
                                        .padding(.bottom, 5)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                    
                                    Text(evento.author)
                                        .font(.custom("MarkPro-Book", size: 18, relativeTo: .title3))
                                        .padding(.bottom,5)
                                        .foregroundColor(.black)
                                    
                                    if(evento.startDate == evento.endDate){
                                        Text(dateFormatter.string(from: evento.startDate))
                                            .font(.custom("MarkPro-Book", size: 15, relativeTo: .callout))
                                            .padding(6)
                                            .foregroundColor(.white)
                                            .background(
                                                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("Rosa Marco"))
                                            )
                                    }
                                    else{
                                        Text(dateFormatter.string(from: evento.startDate) + " - " + dateFormatter.string(from: evento.endDate))
                                            .font(.custom("MarkPro-Book", size: 15, relativeTo: .callout))
                                            .padding(6)
                                            .foregroundColor(.white)
                                            .background(
                                                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("RosaMarco"))
                                            )
                                    }
                                    
                                    Text(evento.description)
                                        .font(.custom("MarkPro-Book", size: 18))
                                        .frame(width: geometry.size.width * 0.90)
                                        .multilineTextAlignment(.center)
                                        //.padding()
                                        .foregroundColor(.black)
                                    
                                    if(evento.paidActivity){
                                        NavigationLink(
                                            destination: WebView(html: evento.urlTickets) ,
                                            label: {
                                                Text("Comprar")
                                            }
                                        )
                                    }
                                    
                                    Spacer()
                                    
                                }
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar(content: {
                                    ToolbarItem(placement: .principal, content: {
                                        Image("LogoMarco")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 20)
                                    })
                                })
                            }
                        }
                        
                    }
                    
//                }
                
            }
            
            
            
            
        }
        
    }
}

/*struct EventoDetailView_Previews: PreviewProvider {
 static var previews: some View {
 EventoDetailView(evento: <#T##Eventos#>)
 }
 }
 */
