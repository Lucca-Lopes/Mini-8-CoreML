//
//  CapturedImageView.swift
//  Mini-8-CoreML
//
//  Created by Aline Reis Silva on 14/11/23.
//

import SwiftUI

struct CapturedImageView: View {
    @EnvironmentObject var vm: ClassificationViewModel
    @Environment (\.dismiss) var dismiss
    @Environment (\.screenSize) var screenSize
    
    @State var exportedView: UIImage? = nil
        
    var body: some View {
        VStack{
            Image(uiImage: (vm.importedImage) ?? UIImage(named: "cachorro")!)
                .resizable()
                .scaledToFill()
                .frame(width: screenSize.width, height: screenSize.height * 0.5)
                .ignoresSafeArea()
            
            //view de descrição da doença do cachorro
            VStack{
                //nome da doença e acurácia
                HStack(alignment: .center){
                    Text(vm.classification)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color("labelColor"))
                    
                    Spacer()
                    
                    Text("\(vm.accuracy)%")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color("labelColor"))
                

                        Image(systemName: "pawprint")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(Color("labelColor"))
                        
                }
                
                Divider()
                    .background(Color("labelColor"))
                
                VStack(alignment: .leading){
                    //descrição
                    Text("description")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("labelColor"))
                        .padding(.vertical)
                    
                    Text(vm.description)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color("labelColor"))
                        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.15, alignment: .leading)
                    
                    //recomendações
                    Text("recommendation")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("labelColor"))
                        .padding(.vertical)
                    
                    Text(vm.recommendation)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color("labelColor"))
                        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.15, alignment: .leading)
                }
            }
            .padding(.horizontal)
            .frame(width: screenSize.width, height: screenSize.height * 0.7, alignment: .top)
            .background{
                BackgroundView()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.top, 250)
            }
            
            .frame(height: screenSize.height * 0.45)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    dismiss()
                    vm.importedImage = nil
                } label: {
                    Image(systemName: "chevron.backward")
                        .fontWeight(.bold)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                ShareLink(item: Image(uiImage: self.exportedView ?? UIImage()), preview: SharePreview("Teste", image: Image(uiImage: self.exportedView ?? UIImage())))
                    .fontWeight(.bold)
                    .onAppear{
                        self.exportedView = ImageRenderer(content: self.body).uiImage!
                    }
            }
        }
        .accentColor(.white)
    }
}
