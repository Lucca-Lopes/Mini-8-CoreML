
//


import SwiftUI
//
struct IntroView: View {
    
    @Environment (\.screenSize) var screenSize
  
    
    @State var fakeIndex: Int = 0

    
    @State var currentIndex: Int = 0
    var body: some View {
        
        NavigationStack{
          
            ZStack{
                            TabView(selection: $fakeIndex){
                                ForEach(imageTabs){ tab in
                                    VStack(alignment: .leading){
                                        
                                        Image(tab.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: screenSize.width * 0.8, height: screenSize.height * 0.4)
                                        Image("cachorro")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: screenSize.width * 0.5)
                                            .ignoresSafeArea()
                                    }
                                    .frame(width: screenSize.width, height: screenSize.height)
                                    
                                    .tag(getIndex(tab: tab))
                                }
                                
                            }
                            .tabViewStyle(.page(indexDisplayMode: .never))
                            .ignoresSafeArea()

                            
                VStack{
                    NavigationLink{
                        
                    }label: {
                        Text("Pular Introdução")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing)
                        
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .bottom){
                        
                        ForEach(imageTabs.indices, id: \.self){index in
                            Capsule()
                                .fill(Color(currentIndex == index ? "AccentColor" : "orange") )
                                .frame(width: currentIndex == index ? 30 : 20, height: 20)
                                .animation(.easeInOut, value: currentIndex)
                        }
                        Spacer()
                        
                        Button{
 
                        }
                    label: {
                        BotaoProximoView()
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(Color("AccentColor"))
                                
                            )
                        
                    }
                        
                        
                    }
                    .padding(.horizontal, 50)
                }
                .frame(width: screenSize.width, height: screenSize.height)

            }

                    .frame(width: screenSize.width, height: screenSize.height)
//                    .padding(.horizontal, 50)

                .background(
                    BackgroundView()
                )

        }
        .onChange(of: fakeIndex) { newValue in
            currentIndex = fakeIndex
            
            
        }

    }
}
    

func getIndex(tab: Tab) -> Int {
        
    
    let index = imageTabs.firstIndex { currentTab in
        return currentTab.id == tab.id
    } ?? 0
        return index
    }
    
//
//
//}
