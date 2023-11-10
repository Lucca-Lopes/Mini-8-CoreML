//
//  ContentView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 31/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            DiseasesDescriptionView()
                .background{
                    BackgroundView()
                }
        }
        
    }
}

//#Preview {
//    ContentView()
//}
