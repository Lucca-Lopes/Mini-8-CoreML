
//


import SwiftUI
//
struct IntroView: View {
    
    @Environment (\.screenSize) var screenSize
    @Environment (\.dismiss) var dismiss
    @StateObject var vm = IntroViewModel()
    @Binding var introPresented: Bool?
    
   
    @State var fakeIndex: Int = 0

    @State var currentIndex: Int = 0
    
    init(introPresented: Binding<Bool?>?){
        self._introPresented = introPresented ?? Binding.constant(nil)
    }
    
    var body: some View {
        
        
        ZStack{
            TabView(selection: $fakeIndex){
                ForEach(vm.imageTabs){ tab in
                    
                  
                    VStack(alignment: .leading, spacing: 0){
                        if self.vm.sholdShow(for: tab){
                            
                            Image(tab.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                               // .frame(width: screenSize.width , height: screenSize.height)

                               .ignoresSafeArea()
                            
                        }
                        else{
                        Spacer()
                            Image(tab.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: screenSize.width, height: screenSize.height * 0.25)
                            
                            Image("cachorro")
////.resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .clipped()
//                                .frame(height: screenSize.height * 0.5, alignment: .bottom)
//                                .background(.green)
//                                .ignoresSafeArea()
                                .resizable()
                                .scaledToFit()
                                .offset(y: 34)
                                .frame(height: screenSize.height * 0.7, alignment: .bottom)
                                .ignoresSafeArea()
                                
                                
                            
                        }
                        
                    }
                       
                      
                        .tag(getIndex(tab: tab))
                }
               
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
           .ignoresSafeArea()

                VStack{

                    Button{
                        if let presented = introPresented {
                            if !presented{
                                introPresented = true
                                UserDefaults.standard.set(true, forKey: "hasShowTutorial")
                            } else {
                                dismiss()
                            }
                        }
                    }label: {
                        if fakeIndex < vm.indexDog {
                            Text("skip")
                                .foregroundStyle(Color("labelColor"))
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing)
                            
                        } else {
                            Text("done")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing)
                            
                        }
                    }
                    Spacer()
                    
                    HStack(alignment: .bottom){
                       
                        ForEach(vm.imageTabs.indices, id: \.self){index in
                            if currentIndex == vm.indexDog {
                                
                                
                            } else{
                                
                                Capsule()
                                    .fill(Color(currentIndex == index ? "AccentColor" : "orange") )
                                    .frame(width: currentIndex == index ? 30 : 15, height: 15)
                                    .animation(.easeInOut, value: currentIndex)
                            }
                                                  }
                            Spacer()
                            
                            Button{
                                fakeIndex = (currentIndex + 1) % vm.imageTabs.count
                                
                            }
                    label: {
                        if fakeIndex < vm.indexDog {
                            BotaoProximoView()
                                .background(
                                    RoundedRectangle(cornerRadius: 40)
                                        .fill(Color("AccentColor"))
                                    
                                )
                        }
                    }
                            
                       
                    }.padding(.bottom)
                    .padding(.trailing, 50)
                    .padding(.leading, 30)
                }
                .frame(width: screenSize.width, height: screenSize.height)
               

        }
            
            .frame(width: screenSize.width, height: screenSize.height)
            .background(
                BackgroundView()
                    
            )
        
            .onChange(of: fakeIndex) { newValue in
                currentIndex = fakeIndex
                
            }
        }

    func getIndex(tab: Tab) -> Int {
        
        let index = vm.imageTabs.firstIndex { currentTab in
            return currentTab.id == tab.id
        } ?? 0
        return index
    }
}

