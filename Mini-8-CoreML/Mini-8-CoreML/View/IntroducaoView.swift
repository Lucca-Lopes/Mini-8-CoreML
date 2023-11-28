//
//  IntroducaoView.swift
//  Mini-8-CoreML
//
//  Created by Jamile Marian Polycarpo on 27/11/23.
//

//import SwiftUI
//
//struct IntroducaoView: View {
//    
//    @Environment (\.screenSize) var screenSize
//    @Environment (\.dismiss) var dismiss
//    @StateObject var vm = IntroViewModel()
//    @Binding var introPresented: Bool?
//    
//    var body: some View {
//        VStack{
//            ForEach(vm.imageTabs){ image in
//                if self.vm.sholdShow(for: image) {
//                   DicasView()
//                        .environmentObject(vm)
//                    
//                } else {
//                    IntroView(introPresented: $introPresented)
//                        .environmentObject(vm)
//                }
//            }
//          
//        }
//    }
//}


