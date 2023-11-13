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
    var infoTitle: [LocalizedStringKey] = ["about", "diseases", "privacy"]
    //recebe o ícone do botão
    var infoIcon: [String] = ["info", "list.bullet.clipboard", "lock"]
    //recebe o texto de cada view
    var infoText: [LocalizedStringKey] = ["aboutText", "diseasesText", "privacyText"]
    
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
        .frame(width: screenSize.width)
        .padding(.top, 30)
        .navigationTitle("info")
        .background(Color("backgroundColor"))
    }
}
