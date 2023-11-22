//
//  DiagnosticoView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 09/11/23.
//

import SwiftUI

struct DiagnosticoView: View {
    @EnvironmentObject var vm: ClassificationViewModel
    
    var body: some View {
        ZStack(alignment: .center){
            Image(uiImage: vm.importedImage!)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            Text(vm.classification)
        }
    }
}
