//
//  SwiftUIView.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 09/11/23.
//

import SwiftUI

struct CameraView: View {
    @StateObject var vm = ClassificationViewModel()
    @State var image: UIImage?
    var body: some View {
        if vm.importedImage != nil {
            DiagnosticoView()
                .environmentObject(vm)
        }
        else {
            CameraManeger(image: $image)
                .onChange(of: image) {
                    vm.importedImage = image
                    vm.onChangeImage()
                }
        }
    }
}
