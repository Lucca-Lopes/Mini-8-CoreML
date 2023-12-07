//
//  InfoButtonComponent.swift
//  Mini-8-CoreML
//
//  Created by Aline Reis Silva on 13/11/23.
//

import SwiftUI

struct InfoButtonComponent: View {
    @Environment (\.screenSize) var screenSize
    var icon: String
    var title: LocalizedStringKey
    
    var body: some View {
        //botões da tela de info
            ZStack{
                //background
                Capsule()
                    .fill(Color("AccentColor"))
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
                    .shadow(radius: 10, x: 0, y: 6)

                HStack{
                    //ícone e titulo do botão
                    Image(systemName: icon)
                        .padding(.trailing)
                    Text(title)
                }
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color("labelColor"))
                .frame(width: screenSize.width * 0.65 , height: screenSize.height * 0.08, alignment: .leading)
            }
        }
}
