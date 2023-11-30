

import SwiftUI

struct CapturedImageView: View {
    @EnvironmentObject var vm: ClassificationViewModel
    @Environment (\.dismiss) var dismiss
    @Environment (\.screenSize) var screenSize
    
    @State var exportedView: UIImage? = nil
    @State var expanded: Bool = false
    @State var expanded2: Bool = false
        
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
                
                ScrollView{
                    VStack(alignment: .leading){
                        //descrição
                        Text("description")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color("labelColor"))
                            .padding(.vertical)
                        Text(vm.description)
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color("labelColor"))
                            .frame(width: screenSize.width * 0.9, alignment: .topLeading)
                            .lineLimit(expanded ? nil : 5)
                        
                        //botão para expandir
                        Button{
                            expanded.toggle()
                        } label: {
                            Text(expanded ? "readLess" : "readMore")
                        }
                        .foregroundStyle(Color("AccentColor"))
                        .frame(width: screenSize.width * 0.9, alignment: .bottomTrailing)
                        
                        //recomendações
                        Text("recommendation")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color("labelColor"))
                            .padding(.vertical)
                        
                        Text(vm.recommendation)
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color("labelColor"))
                            .frame(width: screenSize.width * 0.9, alignment: .topLeading)
                            .lineLimit(expanded2 ? nil : 5)

                        //botão para expandir
                        Button{
                            expanded2.toggle()
                        } label: {
                            Text(expanded2 ? "readLess" : "readMore")
                        }
                    }
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    vm.importedImage = nil
                } label: {
                    Image(systemName: "chevron.backward")
                        .fontWeight(.bold)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                ShareLink(item: Image(uiImage: self.exportedView ?? UIImage()), preview: SharePreview("Teste", image: Image(uiImage: self.exportedView ?? UIImage()))){
                    Image(systemName: "square.and.arrow.up")
                        .fontWeight(.bold)
                }
                    .onAppear{
                        self.exportedView = ImageRenderer(content: self.body).uiImage!
                    }

            }
        }
        .accentColor(.white)
    }
}
