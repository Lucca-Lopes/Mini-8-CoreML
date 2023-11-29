//
//  SwiftUIView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 09/11/23.
//

import SwiftUI

struct CameraView: View {
    @Environment (\.screenSize) var screenSize
    @StateObject var vm = ClassificationViewModel()
    @State var image: UIImage?
    
    init(){
        UINavigationBar.appearance().barTintColor = UIColor(.clear)
    }
    
    var body: some View {
        if vm.importedImage != nil {
            CapturedImageView()
                .environmentObject(vm)
                .navigationBarBackButtonHidden()
                .ignoresSafeArea()
        }
        else {
            VStack{
                CameraManeger(image: $image)
                    .navigationBarBackButtonHidden()
//                    .ignoresSafeArea()
                    .onChange(of: image, perform: { value in
                        vm.importedImage = value
                        vm.onChangeImage()
                    })
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink{
                        InfoView()
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }
                }
                
            }
        }
    }
}
