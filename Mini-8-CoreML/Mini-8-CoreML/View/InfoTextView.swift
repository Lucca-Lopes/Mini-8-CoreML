//
//  InfoTextView.swift
//  Mini-8-CoreML
//
//  Created by Aline Reis Silva on 13/11/23.
//

import SwiftUI

struct InfoTextView: View {
    @Environment(\.screenSize) var screenSize
    
    //variáveis que recebem o texto e título
    var infoText: String
    var infoTitle: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(infoText)
                .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.82, alignment: .topLeading)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color("labelColor"))
                .multilineTextAlignment(.leading)
        }
        .navigationTitle(infoTitle)
    }
}
