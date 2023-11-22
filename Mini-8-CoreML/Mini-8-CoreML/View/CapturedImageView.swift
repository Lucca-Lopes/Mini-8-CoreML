

import SwiftUI

struct CapturedImageView: View {
    @Environment (\.dismiss) var dismiss
    @Environment (\.screenSize) var screenSize
    
    var image: Image
    @State var photo: UIImage
    @State var disease: String
    @State var accuracy: String
    @State var description: String
    @State var recommendations: String
    
    
    var body: some View {
        VStack{
            image
                .resizable()
                .scaledToFill()
                .frame(width: screenSize.width, height: screenSize.height * 0.5)
                .ignoresSafeArea()
            
            //view de descrição da doença do cachorro
            VStack{
                //nome da doença e acurácia
                HStack(alignment: .center){
                    Text(disease)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color("labelColor"))
                    
                    Spacer()
                    
                    Text("0%")
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
                    
                    Text(description)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color("labelColor"))
                        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.15, alignment: .leading)
                    
                    //recomendações
                    Text("recommendation")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("labelColor"))
                        .padding(.vertical)
                    
                    Text(recommendations)
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
                } label: {
                    Image(systemName: "chevron.backward")
                        .fontWeight(.bold)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                ShareLink(item: Image(uiImage: photo), preview: SharePreview("Teste", image: Image(uiImage: photo)))
                    .fontWeight(.bold)
                    .onAppear{
                        photo = ImageRenderer(content: self.body).uiImage!
                    }
            }
        }
        .accentColor(.white)
    }
}
