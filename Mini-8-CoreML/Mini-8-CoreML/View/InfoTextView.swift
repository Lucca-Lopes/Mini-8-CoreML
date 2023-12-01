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
        VStack(alignment: .leading){
            if infoText == "diseasesText"{
                
                Text(infoText)
                    .frame(width: screenSize.width * 0.9, alignment: .topLeading)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(Color("labelColor"))
                    .multilineTextAlignment(.leading)
                
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
            } else if infoText == "datasetText"{
                ScrollView{
                    Text(infoText)
                        .frame(width: screenSize.width * 0.9, alignment: .topLeading)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color("labelColor"))
                        .multilineTextAlignment(.leading)
                    Link(destination: .init(string: "https://universe.roboflow.com/captain-blank-bodop/sample-k1xk8")!) {
                        Text("https://universe.roboflow.com/captain-blank-bodop/sample-k1xk8")
                            .frame(width: screenSize.width * 0.9, alignment: .topLeading)
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color("labelColor"))
                            .multilineTextAlignment(.leading)
                    }
                }
            } else {
                ScrollView{
                    Text(infoText)
                        .frame(width: screenSize.width * 0.9, alignment: .topLeading)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color("labelColor"))
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 30)
        .navigationTitle(infoTitle)
        .frame(width: screenSize.width, height: screenSize.height, alignment: .topLeading)
        .background(Color("backgroundColor"))
    }
}
