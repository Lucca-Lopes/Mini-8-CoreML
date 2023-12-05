//
//  LiveCamView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 29/11/23.
//

import SwiftUI

struct LiveCamView: View {
    @Environment (\.screenSize) var screenSize
    @StateObject var vm = ClassificationViewModel()
    @StateObject var photoVm = LiveCamViewController()
    var body: some View {
        ZStack{
            HostedViewController()
                .environmentObject(vm)
            VStack{
               
                CapturedImageView()
                    .environmentObject(vm)
                
            }
        }
            .ignoresSafeArea()
    }
}
