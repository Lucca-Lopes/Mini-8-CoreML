//
//  DiseasesDescriptionView.swift
//  Mini-8-CoreML
//
//  Created by Aline Reis Silva on 09/11/23.
//

import SwiftUI

struct DiseasesDescriptionView: View {
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        //view de descrição da doença do cachorro
        VStack(alignment:.leading){
            //nome da doença e acurácia
            HStack(alignment: .center){
                Text("Doença")
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
            
            //descrição
            Text("Descrição")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color("labelColor"))
                .padding(.vertical)

            Text("Worem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. ")
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color("labelColor"))
            
            //recomendações
            Text("Recomendações")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color("labelColor"))
                .padding(.vertical)

            Text("Worem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. ")
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color("labelColor"))
            
        }
        .padding(.horizontal)
        .frame(width: screenSize.width, height: screenSize.height, alignment: .top)
        .background{
            BackgroundView()
        }
    }
}


