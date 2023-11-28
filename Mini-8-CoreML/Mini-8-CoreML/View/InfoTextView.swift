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
    var infoText: LocalizedStringKey
    var infoTitle: LocalizedStringKey
    var diseases: [LocalizedStringKey] = ["healthy", "circularAlopecia", "keratosis", "skinLesion"]
    var diseasesDescription: [LocalizedStringKey] = ["healthyDescription", "circularAlopeciaDescription", "keratosisDescription", "skinLesionDescription"]

    
    var body: some View {
//        ScrollView{
            VStack(alignment: .leading){
                Text(infoText)
                    .frame(width: screenSize.width * 0.9, alignment: .topLeading)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(Color("labelColor"))
                    .multilineTextAlignment(.leading)
                if infoText == "diseasesText"{
                    
                        List{
                            ForEach(0..<diseases.count, id: \.self) { i in
                            DisclosureGroup{
                                Text(diseasesDescription[i])
                            } label: {
                                Text(diseases[i])
                            }
                            .foregroundStyle(Color("labelColor"))
                            .padding(.vertical)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .padding(.horizontal)
//        }
        .navigationTitle(infoTitle)
        .frame(width: screenSize.width)
        .background(Color("backgroundColor"))
    }
}
