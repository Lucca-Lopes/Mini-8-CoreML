//
//  InfoView.swift
//  Mini-8-CoreML
//
//  Created by Aline Reis Silva on 13/11/23.
//

import SwiftUI

struct InfoView: View {
    @Environment (\.screenSize) var screenSize
    //recebe o título do botão
    var infoTitle: [String] = ["Sobre", "Doenças", "Privacidade"]
    //recebe o ícone do botão
    var infoIcon: [String] = ["info", "list.bullet.clipboard", "lock"]
    //recebe o texto de cada view
    var infoText: [String] = ["texto de sobre", "texto de doenças", "texto de privacidade"]
    
    var body: some View {
        VStack(spacing: 30){
            ForEach(0..<infoTitle.count, id: \.self) { i in
                NavigationLink{
                    InfoTextView(infoText: infoText[i], infoTitle: infoTitle[i])
                } label: {
                    InfoButtonComponent(icon: infoIcon[i], title: infoTitle[i])
                }
            }
            
            Spacer()
        }
        .padding(.top, 30)
        .navigationTitle("Informações")
    }
}
