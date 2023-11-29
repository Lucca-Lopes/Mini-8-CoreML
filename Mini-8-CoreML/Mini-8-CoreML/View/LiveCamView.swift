//
//  LiveCamView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 29/11/23.
//

import SwiftUI

struct LiveCamView: View {
    @StateObject var vm = ClassificationViewModel()
    var body: some View {
        ZStack{
            HostedViewController()
                .environmentObject(vm)
            HStack {
                Text(vm.classification)
                Text(" - ")
                Text("\(vm.accuracy)%")
            }
            
        }
            .ignoresSafeArea()
    }
}
