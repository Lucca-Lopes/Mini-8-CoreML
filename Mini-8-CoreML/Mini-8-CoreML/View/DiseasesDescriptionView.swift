//
//  DiseasesDescriptionView.swift
//  Mini-8-CoreML
//
//  Created by Aline Reis Silva on 09/11/23.
//

import SwiftUI

struct DiseasesDescriptionView: View {
    @Environment (\.screenSize) var screenSize
    @State var disease: String
    @State var accuracy: String
    @State var description: String
    @State var recommendations: String
    
    var body: some View {
        
        //view de descrição da doença do cachorro
        VStack(alignment:.leading){
            //nome da doença e acurácia
            HStack(alignment: .center){
                Text(disease)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(Color("labelColor"))
                
                Spacer()
                
                Text("0%")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(Color("labelColor"))
            
                Image(systemName: "pawprint")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(Color("labelColor"))
            }
            
            Divider()
                .background(Color("labelColor"))
            
            //TODO: localizar títulos para inglês e português
            //descrição
            Text("description")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color("labelColor"))
                .padding(.vertical)

            Text(description)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color("labelColor"))
            
            //recomendações
            Text("recommendation")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color("labelColor"))
                .padding(.vertical)

            Text(recommendations)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color("labelColor"))
            
        }
        .padding(.horizontal)
        .frame(width: screenSize.width, alignment: .top)
        .background{
            BackgroundView()
        }
    }
}


