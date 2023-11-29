//
//  BackgroundView.swift
//  Mini-8-CoreML
//
//  Created by Aline Reis Silva on 09/11/23.
//

import SwiftUI

struct BackgroundView: View {
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
            Image("backgroundImage")
                .resizable()
                .scaledToFill()
                .background(Color("backgroundColor"))
                .ignoresSafeArea()
        }
}
